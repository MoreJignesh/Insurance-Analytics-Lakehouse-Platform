{% macro calculate_customer_risk(
    credit_score,
    previous_claims,
    smoking_status,
    age
) %}

    (
        (CASE WHEN {{ credit_score }} < 500 THEN 30 ELSE 0 END) +
        (COALESCE({{ previous_claims }}, 0) * 10) +
        (CASE WHEN {{ smoking_status }} = 'Yes' THEN 20 ELSE 0 END) +
        (CASE WHEN {{ age }} > 60 THEN 10 ELSE 0 END)
    )

{% endmacro %}
