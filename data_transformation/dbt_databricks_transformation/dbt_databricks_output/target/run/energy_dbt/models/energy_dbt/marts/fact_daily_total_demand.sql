
    
  create or replace table `energy_model`.`default_marts`.`fact_daily_total_demand`
  
  (
    
      `fact_demand_key` string,
    
      `period_date` date,
    
      `total_demand_mwh` double COMMENT 'The total demand in MWh for that period'
    
    
  )

  
    using delta
  
  
  
  
  
  
  
  

  