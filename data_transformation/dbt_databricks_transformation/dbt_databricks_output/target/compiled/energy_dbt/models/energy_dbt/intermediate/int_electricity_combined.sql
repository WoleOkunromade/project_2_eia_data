with demand as (
    select *
    from `energy_model`.`default`.`stg_eia_demand_forecast`
),
generation as (
    select *
    from `energy_model`.`default`.`stg_eia_generation`
),
subregion as (
    select *
    from `energy_model`.`default`.`stg_eia_demand_subregion`
),

combined as (
    select
        coalesce(d.period_ts, g.period_ts, s.period_ts) as period_ts,
        d.respondent as demand_respondent,
        g.respondent_code as generation_respondent,
        s.subregion_code,

        d.value_mwh as demand_mwh,
        g.value_mwh as generation_mwh,
        s.value_mwh as subregion_mwh,

        d.type_name as demand_type,
        g.fuel_type_name as generation_fuel_type,

        -- calculation
        g.value_mwh - d.value_mwh as net_generation_mwh,

        -- window function: rank highest generation per fuel type per day
        rank() over (partition by g.fuel_type_name, date_trunc('day', coalesce(d.period_ts, g.period_ts))
                     order by g.value_mwh desc) as rank_per_fuel
    from demand d
    full outer join generation g
        on d.period_ts = g.period_ts
    full outer join subregion s
        on coalesce(d.period_ts, g.period_ts) = s.period_ts
)

select *
from combined
order by period_ts