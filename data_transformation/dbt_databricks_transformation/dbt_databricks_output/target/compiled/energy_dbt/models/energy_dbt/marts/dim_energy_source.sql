

with base as (
    select distinct
        fuel_type,
        fuel_type_name,
        respondent_code,
        value_mwh,
        period_ts as date_energy_source 
    from `energy_model`.`default`.`stg_eia_generation`
),

final as (
    select
        md5(cast(concat(coalesce(cast(fuel_type as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(date_energy_source as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(respondent_code as string), '_dbt_utils_surrogate_key_null_')) as string)) as energy_source_key,
        date_energy_source,
        fuel_type,
        fuel_type_name,
        respondent_code,
        value_mwh
    from base
)

select * from final



  where date_energy_source > (select coalesce(max(date_energy_source), '1900-01-01'::date) from `energy_model`.`default_marts`.`dim_energy_source`)
  
