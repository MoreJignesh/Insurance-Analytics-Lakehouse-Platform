

-- models/silver/stg_insurance_customers.sql
-- Changes made as on 2026-01-17 by jm

WITH source_data AS (

    SELECT 
        id AS customer_id, 

        NULLIF(INITCAP(TRIM(`gender`)), '') AS gender,
        NULLIF(INITCAP(TRIM(`marital_status`)), '') AS marital_status,
        NULLIF(INITCAP(TRIM(`education_level`)), '') AS education_level,
        NULLIF(INITCAP(TRIM(`occupation`)), '') AS occupation,
        NULLIF(INITCAP(TRIM(`location`)), '') AS location,
        NULLIF(INITCAP(TRIM(`property_type`)), '') AS property_type,

        Age::INT AS age,
        TRY_CAST("annual_income" as INT) AS annual_income,
        TRY_CAST("number_of_dependents" as INT) AS number_of_dependents,
        TRY_CAST("credit_score" as INT) AS credit_score,
        TRY_CAST("vehicle_age" as INT) AS vehicle_age,
        TRY_CAST("previous_claims" as INT) AS previous_claims,

        TRY_CAST("policy_start_date" as TIMESTAMP) AS policy_start_date,
        CURRENT_TIMESTAMP AS dbt_loaded_at

    FROM {{ source('src_bronze', 'bronze_staging_table') }}


)

SELECT *
FROM source_data
