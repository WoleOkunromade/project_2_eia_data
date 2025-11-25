
    
    

select
    _airbyte_raw_id as unique_field,
    count(*) as n_records

from `energy_raw`.`raw`.`eia_electricity_demand_subregion`
where _airbyte_raw_id is not null
group by _airbyte_raw_id
having count(*) > 1


