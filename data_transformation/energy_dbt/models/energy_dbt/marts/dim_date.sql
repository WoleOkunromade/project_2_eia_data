{{ config(materialized='table', unique_key='date_key') }}

with base as (

    select distinct
        period_ts::date as date_day,
        extract(year  from period_ts) as year,
        extract(month from period_ts) as month,
        extract(day   from period_ts) as day,
        extract(hour  from period_ts) as hour
    from {{ ref('int_electricity_combined') }}

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['date_day']) }} as date_key,
        date_day,
        year,
        month,
        day,
        hour
    from base

)

select * from final
