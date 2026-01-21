{{ config(materialized='table') }}

select
    id,

    policy_type,
    insurance_duration,
    policy_term_category

from {{ ref('int_policy_features') }}
