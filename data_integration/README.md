# Data Integration for Energy Pipeline

This folder contains configuration files for integrating energy data into **Databricks** and **Snowflake** using **Airbyte**. The integration pulls data from **EIA (Energy Information Administration)** APIs and loads it into Databricks or Snowflake for further analysis.

## Folder Structure

- **airbyte_databricks_connections**: Contains Airbyte connection configurations for Databricks.
  - **destinations**: Databricks destination connection configurations.
  - **sources**: Source connection configurations for pulling data from EIA APIs.
  - **YAML files**: Corresponding YAML files that define the data extraction and schema normalization for each source.

- **airbyte_snowflake_connections**: Contains Airbyte connection configurations for Snowflake.
  - **destinations**: Snowflake destination connection configurations.
  - **sources**: Source connection configurations for pulling data from EIA APIs.
  - **YAML files**: Corresponding YAML files for defining data extraction and schema normalization for each source.

### Key Files

1. **Databricks Destination**:
   - `databricks_project_2.json`: Configuration to connect Airbyte to a Databricks workspace.
   
2. **Snowflake Destination**:
   - `snowflake_project_2.json`: Configuration to connect Airbyte to a Snowflake account (similar structure to Databricks destination).

3. **EIA Data Sources (JSON)**:
   - `eia_electricity_demand_forecast.json`: Configuration for pulling electricity demand forecast data from the EIA API.
   - `eia_electricity_demand_subregion.json`: Configuration for pulling electricity demand by subregion data.
   - `eia_electricity_generation.json`: Configuration for pulling electricity generation data.

4. **Source Definition (YAML)**:
   - `eia_electricity_demand_forecast.yaml`: Defines the Airbyte source configuration for the **electricity demand forecast** API. This includes details on the data retrieval method, schema normalization, and specific data extraction instructions.
   - `eia_electricity_demand_subregion.yaml`: Defines the source configuration for the electricity demand by subregion.
   - `eia_electricity_generation.yaml`: Defines the source configuration for the electricity generation data.

## Usage

1. **Setup Airbyte**:
   - Install and configure an Airbyte instance.
   - Use the `databricks_project_2.json` or `snowflake_project_2.json` file to connect to your Databricks or Snowflake workspace. Update the configurations with your workspace ID, authentication token, and other details.

2. **Configure Sources**:
   - Edit the EIA source files (`eia_electricity_demand_forecast.json`, `eia_electricity_demand_subregion.json`, etc.) with the correct API URLs and authentication details.
   - The corresponding YAML files (`eia_electricity_demand_forecast.yaml`, `eia_electricity_demand_subregion.yaml`, etc.) define how data should be extracted, normalized, and processed for each data source.
   
3. **Run the Integration**:
   - Once Airbyte is set up, trigger the data pipelines to ingest EIA data into either Databricks or Snowflake. The data will be processed, normalized, and loaded into the destination based on the configurations in the JSON and YAML files.

## File Overview

- **JSON Files (`*.json`)**: Define the connection configurations for sources (EIA APIs) and destinations (Databricks or Snowflake).
- **YAML Files (`*.yaml`)**: Define the detailed structure of the Airbyte source configurations. These include instructions for data extraction (via HTTP requests, database queries, etc.), schema normalization, and other processing steps for each data stream.

### Example YAML Breakdown:

- **eia_electricity_demand_forecast.yaml**:
  - **Type**: DeclarativeSource
  - **Retriever**: Defines how data is fetched (e.g., via HTTP request).
  - **Schema Normalization**: Specifies the data structure (JSON schema) for the source data.
  - **Streams**: Defines individual data streams to be ingested, such as electricity demand forecasts.

## Notes

- **Schema Normalization**: Ensures that incoming data is transformed into the correct format before loading into Databricks or Snowflake.
- **Concurrency**: The default concurrency level for data ingestion is set to `1`. You can adjust this setting based on your needs for parallelism.

