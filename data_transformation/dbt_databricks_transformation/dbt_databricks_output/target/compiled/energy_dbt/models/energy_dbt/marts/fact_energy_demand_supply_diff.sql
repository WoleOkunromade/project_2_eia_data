

SELECT
    md5(cast(concat(coalesce(cast(fact_demand_key as string), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(period_date as string), '_dbt_utils_surrogate_key_null_')) as string)) AS surrogate_key,
    fdd.fact_demand_key,
    fdd.period_date,
    fdd.total_demand_mwh,
    fds.total_energy_value,

    (fdd.total_demand_mwh - fds.total_energy_value) AS net_diff,
    
    
    CURRENT_DATE AS start_date, -- The date this record starts being valid
    1 AS is_current            -- Set to 1 to mark it as the current record
FROM
    `energy_model`.`default_marts`.`fact_daily_total_demand` fdd
LEFT JOIN
    `energy_model`.`default_marts`.`fact_daily_total_source` fds
ON
    fdd.period_date = fds.date_energy_source
ORDER BY
    fdd.period_date DESC