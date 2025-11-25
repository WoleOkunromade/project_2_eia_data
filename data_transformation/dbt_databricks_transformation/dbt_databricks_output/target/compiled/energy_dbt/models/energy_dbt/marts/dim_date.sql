

with base as (

    select distinct
        period_ts::date as date_day,
        extract(year  from period_ts) as year,
        extract(month from period_ts) as month,
        extract(day   from period_ts) as day,
        extract(hour  from period_ts) as hour
    from `energy_model`.`default`.`int_electricity_combined`

),

final as (

    select
        md5(cast(concat(coalesce(cast(date_day as string), '_dbt_utils_surrogate_key_null_')) as string)) as date_key,
        date_day,
        year,
        month,
        day,
        hour
    from base

)

select * from final