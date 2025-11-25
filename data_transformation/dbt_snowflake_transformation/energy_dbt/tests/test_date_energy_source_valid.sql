SELECT
    date_energy_source
FROM {{ ref('fact_daily_total_source') }}  
WHERE date_energy_source IS NULL
   OR date_energy_source NOT LIKE '____-__-__'  
