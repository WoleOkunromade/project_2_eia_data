{{ config(materialized='incremental', unique_key='_airbyte_raw_id') }}

with source_data as (
    select
        _airbyte_raw_id,
        _airbyte_extracted_at::timestamp as extracted_at,
        _airbyte_generation_id as generation_id,
        type as type_short,
        "TYPE-NAME" as type_name,
        value::float as value_mwh,
        "VALUE-UNITS" as value_units,
        respondent,
        "RESPONDENT-NAME" as respondent_name,
        to_timestamp(period, 'YYYY-MM-DD"T"HH24-MI') as period_ts
    from {{ source('energy_raw', 'eia_electricity_demand_forecast') }}
)

select *
from source_data
where value_mwh is not null

{% if is_incremental() %}
  and period_ts > (select max(period_ts) from {{ this }})
{% endif %}

order by period_ts