
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select _airbyte_extracted_at
from `energy_raw`.`raw`.`eia_electricity_demand_subregion`
where _airbyte_extracted_at is null



  
  
      
    ) dbt_internal_test