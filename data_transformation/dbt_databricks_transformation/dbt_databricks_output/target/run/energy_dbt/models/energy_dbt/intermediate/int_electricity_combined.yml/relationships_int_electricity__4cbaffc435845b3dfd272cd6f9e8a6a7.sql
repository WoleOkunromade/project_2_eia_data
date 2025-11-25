
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select generation_respondent as from_field
    from `energy_model`.`default`.`int_electricity_combined`
    where generation_respondent is not null
),

parent as (
    select respondent_code as to_field
    from `energy_model`.`default`.`stg_eia_generation`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test