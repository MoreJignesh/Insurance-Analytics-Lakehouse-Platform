select
    sum(f.previous_claims) / count(*) as loss_ratio
from {{ ref('fct_claims') }} f
