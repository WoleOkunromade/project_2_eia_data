
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT COUNT(*) AS num_rows
FROM `energy_model`.`default_marts`.`fact_energy_demand_supply_diff`
HAVING COUNT(*) < 1
  
  
      
    ) dbt_internal_test