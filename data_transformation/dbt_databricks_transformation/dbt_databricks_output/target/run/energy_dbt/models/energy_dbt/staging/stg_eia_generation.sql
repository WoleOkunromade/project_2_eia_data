-- back compat for old kwarg name
  
  
  
  
  
  
      
          
          
      
  

    merge
    into
        `energy_model`.`default`.`stg_eia_generation` as DBT_INTERNAL_DEST
    using
        `stg_eia_generation__dbt_tmp` as DBT_INTERNAL_SOURCE
    on
        
              DBT_INTERNAL_SOURCE.`_airbyte_raw_id` <=> DBT_INTERNAL_DEST.`_airbyte_raw_id`
          
    when matched
        then update set
            *
    when not matched
        then insert
            *
