{{ config(materialized='table',unique_key='subregion_key') }}

with base as (
    select distinct
        period_ts::date as date_subregion,
        subregion_code,
        subregion_name,
        parent_region_code,
        parent_region_name,
        value_mwh
    from {{ ref('stg_eia_demand_subregion') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['subregion_code', 'date_subregion']) }} as subregion_key,
        date_subregion,
        subregion_code,
        subregion_name,
        parent_region_code,
        parent_region_name,
        value_mwh
    from base
)

select * from final
