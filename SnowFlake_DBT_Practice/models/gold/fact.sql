{% set configs = [
    {
        "table": "AIRBNB.gold.obt",
        "columns": "gold_obt.booking_id, gold_obt.listing_id, gold_obt.host_id, gold_obt.total_amount, gold_obt.price_per_night",
        "alias": "gold_obt"
    }
]%}


SELECT 
{% for config in configs %}
    {{ config.columns }}{% if not loop.last %},{% endif %}
{% endfor %}
FROM {{ configs[0].table }} AS {{ configs[0].alias }}
{% for config in configs[1:] %}
    LEFT JOIN {{ config.table }} AS {{ config.alias }} ON {{ config.join_condition }}
{% endfor %}