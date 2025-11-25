

with source_data as (
    select 
        type_short,
        type_name,
        value_mwh,
        respondent, 
        respondent_name,
        value_units,
        period_ts
    from `energy_model`.`default`.`stg_eia_demand_forecast`
),

final as (
    select
        md5(cast(concat(coalesce(cast(type_short as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(respondent as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(period_ts as string), '_dbt_utils_surrogate_key_null_')) as string)) as demand_sk,
        period_ts,
        type_short,
        type_name,
        respondent, 
        respondent_name,
        value_mwh,
        value_units
    from source_data
)

select *
from final


    where period_ts > (select max(period_ts) from `energy_model`.`default_marts`.`dim_demand`)
