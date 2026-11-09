{% macro trimmer(col) %}
    {{ col | trim | upper }}
{% endmacro %}