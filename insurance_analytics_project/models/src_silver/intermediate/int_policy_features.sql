{{ config(materialized='table') }}

select
    id,

    policy_type,
    insurance_duration,

    case
        when insurance_duration <= 3 then 'Short Term'
        when insurance_duration between 4 and 7 then 'Mid Term'
        else 'Long Term'
    end as policy_term_category

from {{ ref('stg_ins_policy') }}
