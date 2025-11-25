
    
  create or replace table `energy_model`.`default_marts`.`fact_daily_total_source`
  
  (
    
      `fact_energy_key` string COMMENT 'Surrogate key for the fact record.',
    
      `date_energy_source` date COMMENT 'The date for which the total energy is reported.',
    
      `total_energy_value` double COMMENT 'The total energy value (sum of MWh) for the given date.'
    
    
  )

  
    using delta
  
  
  
  
  
  
  
  

  