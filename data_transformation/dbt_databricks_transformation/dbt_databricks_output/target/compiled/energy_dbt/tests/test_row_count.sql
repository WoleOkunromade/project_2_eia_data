SELECT COUNT(*) AS num_rows
FROM `energy_model`.`default_marts`.`fact_energy_demand_supply_diff`
HAVING COUNT(*) < 1