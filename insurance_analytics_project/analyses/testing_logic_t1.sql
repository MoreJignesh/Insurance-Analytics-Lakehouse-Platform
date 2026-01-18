

-- models/silver/stg_insurance_customers.sql

WITH source_data AS (

    SELECT 
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} AS customer_sk,
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
FROM source_data
