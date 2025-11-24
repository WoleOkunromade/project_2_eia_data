{{ config(materialized='table',unique_key='respondent_key', database='energy_model', schema='marts') }}

select distinct
    {{ dbt_utils.generate_surrogate_key(['respondent']) }} as respondent_key,
    respondent as respondent_code,
    respondent_name
from {{ ref('stg_eia_demand_forecast') }}