
{{ config(materialized='view') }}

WITH base AS (

    SELECT
        id,
        policy_type,
        insurance_duration,
        policy_start_date,
        property_type,
        vehicle_age

    FROM {{ source('src_bronze', 'bronze_staging_table') }}

)

SELECT *
FROM base

