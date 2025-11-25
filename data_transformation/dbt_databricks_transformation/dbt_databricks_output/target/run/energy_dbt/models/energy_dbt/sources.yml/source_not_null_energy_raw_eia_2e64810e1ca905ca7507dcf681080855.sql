
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select subba
from `energy_raw`.`raw`.`eia_electricity_demand_subregion`
where subba is null



  
  
      
    ) dbt_internal_test