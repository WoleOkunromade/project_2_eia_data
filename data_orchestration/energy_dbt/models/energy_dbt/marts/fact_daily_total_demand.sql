{{ config(materialized='table',database='energy_model', schema='marts') }}

with demand_data as ( 
    select
        dd.demand_sk,
        CAST(dd.period_ts AS DATE) as date_1,  
        dd.type_short,
        dd.type_name,
        dd.respondent,
        dd.respondent_name,
        dr.respondent_key,
        dd.value_mwh,
        dd.value_units
    from {{ ref('dim_demand') }} dd
    left join {{ ref('dim_respondent') }} dr
        on dd.respondent = dr.respondent_code
),

total_demand as (
    select
        date_1,
        sum(dd.value_mwh) as total_demand_mwh
    from demand_data dd
    group by dd.date_1
)

select
    {{ dbt_utils.generate_surrogate_key(['date_1']) }} as fact_demand_key,  -- changed 'period_ts' to 'date_1'
    td.date_1 AS period_date,  
    td.total_demand_mwh
from total_demand td
order by period_date desc

