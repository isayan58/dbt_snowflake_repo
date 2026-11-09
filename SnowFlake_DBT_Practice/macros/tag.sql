{% macro tag(col) %}
    case
        when {{ col }} < 200 then 'low'
        when {{ col }} < 500 then 'medium'
        else 'high'
    end
{% endmacro %}
