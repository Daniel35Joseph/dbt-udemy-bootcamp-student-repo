{% macro select_positive_values(model, column_name) %}
SELECT * 
FROM {{model}}
WHERE {{column_name}} > 0
{{ log('SELECT query launched.') }}
{% endmacro %}