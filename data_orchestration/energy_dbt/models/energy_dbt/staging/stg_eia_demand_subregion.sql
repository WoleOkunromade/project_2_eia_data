{{ config(materialized='incremental', unique_key='airbyte_raw_id') }}

with source_data as (
    select
        _airbyte_raw_id as airbyte_raw_id,
        _airbyte_extracted_at::timestamp as extracted_at,
        _airbyte_generation_id as generation_id,
        subba as subregion_code,
        subba_name as subregion_name,
        parent as parent_region_code,
        parent_name as parent_region_name,
        value::float as value_mwh,
        value_units,
        try_to_timestamp(CONCAT(REPLACE(period, 'T', ' '), ':00'), 'yyyy-MM-dd HH-mm:ss') AS period_ts
    from {{ source('energy_raw', 'eia_electricity_demand_subregion') }}
    where value::float >= 0
)

select *
from source_data
{% if is_incremental() %}
    where period_ts > (
        select coalesce(max(period_ts), '1970-01-01'::timestamp) 
        from {{ this }}
    )
{% endif %}
order by period_ts
