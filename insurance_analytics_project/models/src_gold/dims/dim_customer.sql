{{ config(materialized='table') }}

select
    id,

    age,
    gender,
    annual_income,
    credit_score,

    health_risk_segment,
    credit_segment

from {{ ref('int_customer_risk') }}
