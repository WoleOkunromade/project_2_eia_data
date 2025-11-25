
    
  create or replace table `energy_model`.`default_marts`.`fact_energy_demand_supply_diff`
  
  (
    
      `surrogate_key` string COMMENT 'Surrogate key generated from a combination of `fact_demand_key` and `period_date`
',
    
      `fact_demand_key` string COMMENT 'The key representing a unique daily demand record in the fact table.
',
    
      `period_date` date COMMENT 'The date corresponding to the demand period.
',
    
      `total_demand_mwh` double COMMENT 'The total demand in megawatt-hours (MWh) for the given period.
',
    
      `total_energy_value` double COMMENT 'The total energy value in the source for the given period.
',
    
      `net_diff` double COMMENT 'The difference between the total demand and the total energy value (demand - energy).
',
    
      `start_date` date COMMENT 'The date this record starts being valid (current date).
',
    
      `is_current` int COMMENT 'Flag indicating if this is the current record (1 for true, NULL for the past record).'
    
    
  )

  
    using delta
  
  
  
  
  
  
  
  

  