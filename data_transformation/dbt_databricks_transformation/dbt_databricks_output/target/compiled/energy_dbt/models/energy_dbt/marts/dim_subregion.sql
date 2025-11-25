

with base as (
    select distinct
        period_ts::date as date_subregion,
        subregion_code,
        subregion_name,
        parent_region_code,
        parent_region_name,
        value_mwh
    from `energy_model`.`default`.`stg_eia_demand_subregion`
),

final as (
    select
        md5(cast(concat(coalesce(cast(subregion_code as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(date_subregion as string), '_dbt_utils_surrogate_key_null_')) as string)) as subregion_key,
        date_subregion,
        subregion_code,
        subregion_name,
        parent_region_code,
        parent_region_name,
        value_mwh
    from base
)

select * from final