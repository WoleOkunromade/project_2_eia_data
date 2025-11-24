{{ config(materialized='incremental', unique_key='airbyte_raw_id') }}

with source_data as (

    select
        _airbyte_raw_id as airbyte_raw_id,
        _airbyte_extracted_at::timestamp as extracted_at,
        _airbyte_generation_id as generation_id,
        subba as subregion_code,
        "SUBBA-NAME" as subregion_name,
        parent as parent_region_code,
        "PARENT-NAME" as parent_region_name,
        value::float as value_mwh,
        "VALUE-UNITS" as value_units,
        to_timestamp(period, 'YYYY-MM-DD"T"HH24-MI') as period_ts
    from {{ source('energy_raw', 'eia_electricity_demand_subregion') }}
    where value::float >= 0

    {% if is_incremental() %}
        and period_ts > (
            select coalesce(max(period_ts), '1970-01-01'::timestamp) 
            from {{ this }}
        )
    {% endif %}

)

select *
from source_data
order by period_ts

