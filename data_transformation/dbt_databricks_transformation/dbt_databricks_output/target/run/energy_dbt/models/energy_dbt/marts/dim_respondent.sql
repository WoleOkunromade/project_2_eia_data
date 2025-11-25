
    
  create or replace table `energy_model`.`default_marts`.`dim_respondent`
  
  (
    
      `respondent_key` string,
    
      `respondent_code` string COMMENT 'Unique code identifying the respondent.',
    
      `respondent_name` string COMMENT 'Name of the respondent.'
    
    
  )

  
    using delta
  
  
  
  
  
  
  
  

  