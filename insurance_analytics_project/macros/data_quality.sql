{% macro high_income_low_credit(income_col, credit_col) %}
    {{ income_col }} > 100000
    AND {{ credit_col }} < 400
{% endmacro %}
