{{ config(materialized='incremental', unique_key='demand_sk') }}

with source_data as (
    select 
        type_short,
        type_name,
        value_mwh,
        respondent, 
        respondent_name,
        value_units,
        period_ts
    from {{ ref('stg_eia_demand_forecast') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['type_short', 'respondent', 'period_ts']) }} as demand_sk,
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

{% if is_incremental() %}
    where period_ts > (select max(period_ts) from {{ this }})
{% endif %}
