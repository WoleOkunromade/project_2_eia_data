-- back compat for old kwarg name
  
  
  
  
  
  
      
          
          
      
  

    merge
    into
        `energy_model`.`default`.`stg_eia_demand_subregion` as DBT_INTERNAL_DEST
    using
        `stg_eia_demand_subregion__dbt_tmp` as DBT_INTERNAL_SOURCE
    on
        
              DBT_INTERNAL_SOURCE.`airbyte_raw_id` <=> DBT_INTERNAL_DEST.`airbyte_raw_id`
          
    when matched
        then update set
            *
    when not matched
        then insert
            *
