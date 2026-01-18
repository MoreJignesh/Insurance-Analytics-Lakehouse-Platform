

-- models/silver/stg_insurance_customers.sql
-- Changes made as on 2026-01-17 by jm

{# WITH source_data AS (

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
FROM source_data #}



{# WITH source_data AS (

    SELECT 
        id as customer_id,
        gender,
        marital_status,
        education_level,
        occupation,
        location,
        property_type,
        age,
        annual_income,
        number_of_dependents,
        credit_score,
        vehicle_age,
        previous_claims,
        policy_start_date,

        CURRENT_TIMESTAMP AS dbt_loaded_at

    FROM {{ source('src_bronze', 'bronze_staging_table') }}

)

SELECT *
FROM source_data #}



-- models/silver/stg_insurance_customers.sql

{# WITH source_data AS (

    SELECT 
    {{ dbt_utils.generate_surrogate_key(['id']) }} AS customer_sk,
        id as customer_id,
        gender
        marital_status,
        education_level,
        occupation,
        location,
        property_type,
        age,
        {# annual_income, #}
        number_of_dependents,
        smoking_status,
        exercise_frequency,
        credit_score,
        {# vehicle_age, #}
        previous_claims,
        policy_start_date,
        Null as policy_end_date,
        {{ calculate_customer_risk(
        'credit_score',
        'previous_claims',
        'smoking_status',
        'age'
                ) }} AS risk_score,
        
        CURRENT_TIMESTAMP AS dbt_loaded_at

    FROM {{ source('src_bronze', 'bronze_staging_table') }}

)

SELECT *
FROM source_data #}



-----Silver again

-- models/silver/stg_customers.sql

WITH base AS (

    SELECT
        id AS customer_id,

        age::INT AS age,
        TRY_CAST(age AS INT) AS age,

        {{ clean_string('gender') }} AS gender,
        {{ clean_string('marital_status') }} AS marital_status,
        {{ clean_string('education_level') }} AS education_level,
        {{ clean_string('occupation') }} AS occupation,
        {{ safe_cast_int('number_of_dependents') }} AS number_of_dependents
        {# TRY_CAST(number_of_dependents AS INT) AS number_of_dependents, #}
        {{ clean_string('location') }} AS location,
        {{ clean_string('property_type') }} AS property_type,

        CURRENT_TIMESTAMP AS dbt_loaded_at

    FROM {{ source('src_bronze', 'bronze_staging_table') }}

)

SELECT *
FROM base
WHERE age BETWEEN 18 AND 100

