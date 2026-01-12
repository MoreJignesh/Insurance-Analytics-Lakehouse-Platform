
SELECT *
 {# min(age), max(age),   min(vehicle_age), max(vehicle_age),   min(credit_score), max(credit_score),   min(insurance_duration), max(insurance_duration)
,   min(annual_income), max(annual_income) #}
FROM  delta.`/Volumes/insurance_analytics_project/src_bronze/bronze_volume/data/`
WHERE ISNULL(vehicle_age)=TRUE
 OR ISNULL(insurance_duration)=TRUE 
{# WHERE ISNULL(policy_start_date)=TRUE  #}

{# SELECT  min(age), max(age),   min(vehicle_age), max(vehicle_age),   min(credit_score), max(credit_score),   min(insurance_duration), max(insurance_duration)
,   min(annual_income), max(annual_income) #}
{# count(distinct health_score), count(distinct policy_start_date) #}
{# LIMIT 100 #}