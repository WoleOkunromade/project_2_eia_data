
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
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
  
  
      
    ) dbt_internal_test