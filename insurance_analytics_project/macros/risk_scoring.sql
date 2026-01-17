{% macro health_score_band(health_score_column) %}
    CASE
        WHEN {{ health_score_column }} IS NULL THEN 'Unknown'
        WHEN {{ health_score_column }} < 10 THEN 'High Risk'
        WHEN {{ health_score_column }} BETWEEN 10 AND 20 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END
{% endmacro %}
