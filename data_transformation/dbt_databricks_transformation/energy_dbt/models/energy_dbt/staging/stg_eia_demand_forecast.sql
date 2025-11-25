WITH source_data AS (
    SELECT
        _airbyte_raw_id,
        _airbyte_extracted_at::timestamp AS extracted_at,
        _airbyte_generation_id AS generation_id,
        type AS type_short,
        type_name,
        value::float AS value_mwh,
        value_units,
        respondent,
        respondent_name,

        try_to_timestamp(CONCAT(REPLACE(period, 'T', ' '), ':00'), 'yyyy-MM-dd HH-mm:ss') AS period_ts
    FROM {{ source('energy_raw', 'eia_electricity_demand_forecast') }}
)

SELECT *
FROM source_data
WHERE value_mwh IS NOT NULL

{% if is_incremental() %}
  AND period_ts > (SELECT MAX(period_ts) FROM {{ this }})
{% endif %}

ORDER BY period_ts

