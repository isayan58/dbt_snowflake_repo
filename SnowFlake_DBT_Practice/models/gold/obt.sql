{% set configs = [
    {
        "table": ref('silver_bookings'),
        "columns": "silver_bookings.*",
        "alias": "silver_bookings"
    },
    {
        "table": ref('silver_listings'),
        "columns": "silver_listings.host_id, silver_listings.property_type, silver_listings.room_type, silver_listings.city, silver_listings.price_per_night, silver_listings.created_at as listing_created_at",
        "alias": "silver_listings",
        "join_condition": "silver_bookings.listing_id = silver_listings.listing_id"
    },
    {
        "table": ref('silver_hosts'),
        "columns": "silver_hosts.host_name, silver_hosts.host_quality, silver_hosts.created_at as host_created_at",
        "alias": "silver_hosts",
        "join_condition": "silver_listings.host_id = silver_hosts.host_id"
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