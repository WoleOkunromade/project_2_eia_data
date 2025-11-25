
    
  create or replace table `energy_model`.`default_marts`.`dim_subregion`
  
  (
    
      `subregion_key` string,
    
      `date_subregion` date,
    
      `subregion_code` string COMMENT 'Unique code identifying the subregion.',
    
      `subregion_name` string COMMENT 'Name of the subregion.',
    
      `parent_region_code` string COMMENT 'Code of the parent region to which the subregion belongs.',
    
      `parent_region_name` string COMMENT 'Name of the parent region to which the subregion belongs.',
    
      `value_mwh` float COMMENT 'Electricity demand in megawatt-hours (MWh).'
    
    
  )

  
    using delta
  
  
  
  
  
  
  
  

  