

select distinct
    md5(cast(concat(coalesce(cast(respondent as string), '_dbt_utils_surrogate_key_null_')) as string)) as respondent_key,
    respondent as respondent_code,
    respondent_name
from `energy_model`.`default`.`stg_eia_demand_forecast`