-- back compat for old kwarg name
  
  
  
  
  
  
      
          
          
      
  

    merge
    into
        `energy_model`.`default_marts`.`dim_demand` as DBT_INTERNAL_DEST
    using
        `dim_demand__dbt_tmp` as DBT_INTERNAL_SOURCE
    on
        
              DBT_INTERNAL_SOURCE.`demand_sk` <=> DBT_INTERNAL_DEST.`demand_sk`
          
    when matched
        then update set
            *
    when not matched
        then insert
            *
