
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select subregion_code as from_field
    from `energy_model`.`default`.`int_electricity_combined`
    where subregion_code is not null
),

parent as (
    select subregion_code as to_field
    from `energy_model`.`default`.`stg_eia_demand_subregion`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test