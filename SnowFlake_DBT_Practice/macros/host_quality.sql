{% macro host_quality(col) %}
    case
        when {{ col }} > 95 then 'Very Good'
        when {{ col }} > 75 then 'Good'
        else 'Average'
    end
{% endmacro %}