WITH invalid_datetime_sources AS (
    SELECT 
        date_energy_source
    FROM 
        `energy_model`.`default_marts`.`fact_daily_total_source`  
    WHERE 
        date_energy_source IS NULL
        OR TRY_CAST(date_energy_source AS TIMESTAMP) IS NULL  -- Check if it can't be cast to a valid TIMESTAMP
)
SELECT date_energy_source
FROM invalid_datetime_sources