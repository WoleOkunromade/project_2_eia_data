WITH row_count AS (
    SELECT COUNT(*) AS num_rows
    FROM {{ ref('fact_energy_demand_supply_diff') }} 
)

SELECT num_rows
FROM row_count
HAVING num_rows < 1  
