
{{ config(materialized='view') }}

WITH base AS (

    SELECT
        id,
        age,
        gender,
        marital_status,
        education_level,
        occupation,
        number_of_dependents,
        location,
        annual_income,
        credit_score,
        smoking_status,
        exercise_frequency,
        health_score,
        customer_feedback

    FROM {{ source('src_bronze', 'bronze_staging_table') }}

)

SELECT *
FROM base


