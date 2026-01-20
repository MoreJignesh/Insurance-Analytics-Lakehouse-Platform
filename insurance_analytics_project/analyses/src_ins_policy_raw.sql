SELECT *
 FROM {{ source('src_bronze', 'bronze_staging_table') }}


{# {{ config(
    materialized = 'table'
) }} #}

{# select *
    {# id                                  as policy_id,
    cast(Age as int)                   as age,
    Gender                             as gender,
    cast(`Annual Income` as double)    as annual_income,
    `Marital Status`                   as marital_status,
    cast(`Number of Dependents` as int) as number_of_dependents,
    `Education Level`                  as education_level,
    Occupation                         as occupation,
    cast(`Health Score` as double)     as health_score,
    Location                           as location,
    `Policy Type`                      as policy_type,
    cast(`Previous Claims` as int)     as previous_claims,
    cast(`Vehicle Age` as int)         as vehicle_age,
    cast(`Credit Score` as int)        as credit_score,
    cast(`Insurance Duration` as int)  as insurance_duration,
    `Policy Start Date`                as policy_start_date,
    `Customer Feedback`                as customer_feedback,
    `Smoking Status`                   as smoking_status,
    `Exercise Frequency`               as exercise_frequency,
    `Property Type`                    as property_type #} #}