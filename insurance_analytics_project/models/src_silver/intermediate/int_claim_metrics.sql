{{ config(materialized='table') }}

select
    id,

    previous_claims,

    case
        when previous_claims = 0 then 'No Claims'
        when previous_claims = 1 then 'Low Claims'
        else 'Frequent Claims'
    end as claims_frequency

from {{ ref('stg_ins_claims') }}
