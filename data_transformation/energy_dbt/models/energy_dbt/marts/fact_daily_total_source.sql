with energy_data as (
    select
        es.energy_source_key,
        r.respondent_key,
        es.date_energy_source,
        es.value_mwh
    from {{ ref('dim_energy_source') }} es
    join {{ ref('dim_respondent') }} r
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
    {{ dbt_utils.generate_surrogate_key(['date_energy_source']) }} as fact_energy_key,
    ad.date_energy_source,
    ad.total_energy_value
from aggregated_data ad
