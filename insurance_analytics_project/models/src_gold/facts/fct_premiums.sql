{{ config(materialized='table') }}

select
    p.id,

    case
        when p.policy_type = 'Basic' then 500
        when p.policy_type = 'Premium' then 1200
        else 1800
    end as annual_premium

from {{ ref('int_policy_features') }} p
