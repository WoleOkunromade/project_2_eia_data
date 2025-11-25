SELECT COUNT(*) AS num_rows
FROM {{ ref('fact_energy_demand_supply_diff') }}
HAVING COUNT(*) < 1