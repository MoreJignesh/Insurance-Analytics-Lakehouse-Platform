{% macro safe_cast_int(column_name) %}

    TRY_CAST({{ column_name }} AS INT)

{% endmacro %}
