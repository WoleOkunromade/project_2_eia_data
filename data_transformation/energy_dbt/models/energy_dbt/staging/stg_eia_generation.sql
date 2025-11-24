{{ config(materialized='incremental', unique_key='_airbyte_raw_id') }}

with source_data as (

    select
        _airbyte_raw_id,
        _airbyte_extracted_at::timestamp as extracted_at,
        _airbyte_generation_id as generation_id,
        fueltype as fuel_type,
        "TYPE-NAME" as fuel_type_name,
        value::float as value_mwh,
        "VALUE-UNITS" as value_units,
        respondent as respondent_code,
        "RESPONDENT-NAME" as respondent_name,
        to_timestamp(period, 'YYYY-MM-DDTHH24-MI') as period_ts
    from {{ source('energy_raw', 'eia_electricity_generation') }}
    where value::float > 0

)

select *
from source_data

{% if is_incremental() %}
  where period_ts > (
      select coalesce(max(period_ts), '1970-01-01'::timestamp_ntz)
      from {{ this }}
  )
{% endif %}

order by period_ts
