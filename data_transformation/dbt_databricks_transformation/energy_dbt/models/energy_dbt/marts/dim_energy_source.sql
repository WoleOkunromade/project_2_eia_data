{{ config(materialized='incremental', unique_key='energy_source_key', database='energy_model', schema='marts') }}

with base as (
    select distinct
        fuel_type,
        fuel_type_name,
        respondent_code,
        value_mwh,
        period_ts as date_energy_source 
    from {{ ref('stg_eia_generation') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['fuel_type', 'date_energy_source', 'respondent_code']) }} as energy_source_key,
        date_energy_source,
        fuel_type,
        fuel_type_name,
        respondent_code,
        value_mwh
    from base
)

select * from final

{% if is_incremental() %}

  where date_energy_source > (select coalesce(max(date_energy_source), '1900-01-01'::date) from {{ this }})
  
{% endif %}
