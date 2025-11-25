
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select period_ts
from `energy_model`.`default`.`stg_eia_demand_forecast`
where period_ts is null



  
  
      
    ) dbt_internal_test