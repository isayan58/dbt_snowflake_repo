{% macro key_hash(columns) %}
    hash({{ columns | join(', ') }})
{% endmacro %}