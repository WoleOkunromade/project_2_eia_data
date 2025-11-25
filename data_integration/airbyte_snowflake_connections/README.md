# Airbyte Ingestion: EIA Electricity Data

This folder contains the Airbyte configuration exports for ingesting 
Electricity Demand Forecast, Generation, and Subregion Demand from the
EIA API into Snowflake (ENERGY_RAW.RAW schema).

Folders:
- sources/       → EIA API configuration file (URL, X-Params header, pagination)
- destinations/  → Snowflake destination configuration

Tables created:
- ENERGY_RAW.RAW.eia_electricity_demand_forecast
- ENERGY_RAW.RAW.eia_electricity_generation
- ENERGY_RAW.RAW.eia_electricity_demand_subregion