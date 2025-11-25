
    
    



select _airbyte_extracted_at
from `energy_raw`.`raw`.`eia_electricity_demand_subregion`
where _airbyte_extracted_at is null


