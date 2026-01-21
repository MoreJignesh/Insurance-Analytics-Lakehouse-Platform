{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['c.id']) }} as customer_sk,

    c.previous_claims,

    case
        when c.previous_claims > 0 then 1 else 0
    end as has_claim

from {{ ref('int_claim_metrics') }} c
