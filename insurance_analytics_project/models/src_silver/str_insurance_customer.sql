
WITH base AS (

    SELECT
        id AS customer_id,
        {# age::INT AS age, #}
        {# TRY_CAST(age AS INT) AS age,

        {{ clean_string('gender') }} AS gender, #}
        {# {{ clean_string('marital_status') }} AS marital_status,
        {{ clean_string('education_level') }} AS education_level, #}
        {# {{ clean_string('occupation') }} AS occupation,
        {{ safe_cast_int('number_of_dependents') }} AS number_of_dependents, #}
        {# TRY_CAST(number_of_dependents AS INT) AS number_of_dependents, #}
        {# {{ clean_string('location') }} AS location,
        {{ clean_string('property_type') }} AS property_type, #}

        CURRENT_TIMESTAMP AS dbt_loaded_at

    FROM {{ source('src_bronze', 'bronze_staging_table') }}

)

SELECT *
FROM base
WHERE age BETWEEN 18 AND 100

