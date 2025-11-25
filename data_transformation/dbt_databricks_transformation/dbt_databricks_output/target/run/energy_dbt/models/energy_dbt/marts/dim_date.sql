
    
  create or replace table `energy_model`.`default_marts`.`dim_date`
  
  (
    
      `date_key` string,
    
      `date_day` date COMMENT 'Date part of the period timestamp.',
    
      `year` int COMMENT 'Year extracted from the period timestamp.',
    
      `month` int COMMENT 'Month extracted from the period timestamp.',
    
      `day` int COMMENT 'Day extracted from the period timestamp.',
    
      `hour` int COMMENT 'Hour extracted from the period timestamp.'
    
    
  )

  
    using delta
  
  
  
  
  
  
  
  

  