
{% set inc_flag = 1 %}
{% set last_load = 3 %}

{% set col_list = ["policy_start_date","id","premium_amount"] %}


SELECT 

    {% for i in col_list %}
        {{ i }}
        {% if not loop.last %}, {% endif %}
    {% endfor%}

FROM 
    {{ ref('bronze_staging_table') }}

{# {% if inc_flag == 1 %}

    WHERE policy_start_date > {{ last_load }} #}

{# {% endif %} #}