

with energy_data as (
    select
        es.energy_source_key,
        r.respondent_key,
        CAST(es.date_energy_source AS DATE),
        es.value_mwh
    from `energy_model`.`default_marts`.`dim_energy_source` es
    join `energy_model`.`default_marts`.`dim_respondent` r
        on es.respondent_code = r.respondent_code
),

aggregated_data as (
    select
        date_energy_source,
        sum(value_mwh) as total_energy_value
    from energy_data
    group by date_energy_source
)

select
    md5(cast(concat(coalesce(cast(date_energy_source as string), '_dbt_utils_surrogate_key_null_')) as string)) as fact_energy_key,
    ad.date_energy_source,
    ad.total_energy_value
from aggregated_data ad