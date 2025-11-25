
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select value_mwh
from `energy_model`.`default`.`stg_eia_demand_forecast`
where value_mwh is null



  
  
      
    ) dbt_internal_test