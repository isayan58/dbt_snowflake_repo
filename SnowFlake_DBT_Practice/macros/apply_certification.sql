{% macro apply_certification() %}
    {% if execute and model.config.meta.get('certified') %}
        ALTER TABLE {{ this }} SET TAG {{ this.database }}.{{ this.schema }}.CERTIFICATION = 'certified'
    {% endif %}
{% endmacro %}