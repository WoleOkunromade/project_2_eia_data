
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select _airbyte_raw_id
from `energy_raw`.`raw`.`eia_electricity_demand_subregion`
where _airbyte_raw_id is null



  
  
      
    ) dbt_internal_test