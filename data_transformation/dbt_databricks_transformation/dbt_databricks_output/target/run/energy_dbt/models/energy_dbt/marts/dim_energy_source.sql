-- back compat for old kwarg name
  
  
  
  
  
  
      
          
          
      
  

    merge
    into
        `energy_model`.`default_marts`.`dim_energy_source` as DBT_INTERNAL_DEST
    using
        `dim_energy_source__dbt_tmp` as DBT_INTERNAL_SOURCE
    on
        
              DBT_INTERNAL_SOURCE.`energy_source_key` <=> DBT_INTERNAL_DEST.`energy_source_key`
          
    when matched
        then update set
            *
    when not matched
        then insert
            *
