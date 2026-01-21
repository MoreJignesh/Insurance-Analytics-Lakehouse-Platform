
{{ config(materialized='table') }}


SELECT
    id,
    age,
    gender,
    annual_income,
    credit_score,
    health_score,
    smoking_status,
    exercise_frequency,
    case when health_score < 8 then 'High Risk'
        when health_score between 8 and 15 then 'Medium Risk'
        else 'Low Risk' end as health_risk_segment,
    case when credit_score < 500 then 'Poor'
        when credit_score between 500 and 700 then 'Average'
        else 'Good' end as credit_segment
    
FROM   {{ ref('stg_ins_customer') }} 

