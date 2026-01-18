
{# SELECT * #}
 {# min(age), max(age),   min(vehicle_age), max(vehicle_age),   min(credit_score), max(credit_score),   min(insurance_duration), max(insurance_duration)
,   min(annual_income), max(annual_income) #}
{# SELECT *
FROM delta.`/Volumes/insurance_analytics_project/src_bronze/bronze_volume/data/` #}
{# WHERE ISNULL(vehicle_age)=TRUE
 OR ISNULL(insurance_duration)=TRUE  #}
{# WHERE ISNULL(policy_start_date)=TRUE  #}

{# SELECT  min(age), max(age),   min(vehicle_age), max(vehicle_age),   min(credit_score), max(credit_score),   min(insurance_duration), max(insurance_duration)
,   min(annual_income), max(annual_income) #}
{# count(distinct health_score), count(distinct policy_start_date) #}
{# LIMIT 100 #}


{# 
SELECT
    *,
    {{ calculate_customer_risk(
        'credit_score',
        'previous_claims',
        'smoking_status',
        'age'
    ) }} AS risk_score
FROM  delta.`/Volumes/insurance_analytics_project/src_bronze/bronze_volume/data/`
-- {{ ref('bronze_staging_table') }} #}


{# as on 17th Jan 2026 #}
{# SELECT *
FROM {{ source('src_bronze', 'bronze_staging_table') }} #}


SELECT *
    -- other cleaned columns
FROM {{ source('src_bronze', 'bronze_staging_table') }}
{# WHERE customer_id = '1200001' #}


SELECT *
    -- other cleaned columns
FROM {{ source('src_silver', 'str_insurance_customer') }}
{# WHERE customer_id = '1200001' #}
