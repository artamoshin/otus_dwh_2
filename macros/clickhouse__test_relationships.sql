{% macro clickhouse__test_relationships(model, column_name, to, field) %}

    {{ default__test_relationships(model, column_name, to, field) }}
    settings join_use_nulls = 1

{% endmacro %}