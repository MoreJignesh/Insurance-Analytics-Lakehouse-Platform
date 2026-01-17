{% macro clean_string(column_name) %}
    NULLIF(
        INITCAP(TRIM({{ column_name }})),
        ''
    )
{% endmacro %}
