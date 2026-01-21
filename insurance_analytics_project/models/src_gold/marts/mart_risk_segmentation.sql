select
    c.health_risk_segment,
    count(*) as customer_count
from {{ ref('dim_customer') }} c
group by 1
