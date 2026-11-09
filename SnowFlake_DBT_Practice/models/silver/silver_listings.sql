{{ config(materialized='incremental', unique_key='key_hash') }}

SELECT
    listing_id,
    host_id,
    property_type,
    room_type,
    accommodates,
    bathrooms,
    bedrooms,
    price_per_night,
    {{ trimmer('city') }} AS city,
    {{ tag('price_per_night') }} AS price_tier,
    created_at,
    {{ key_hash(['listing_id']) }} AS key_hash
FROM {{ ref('bronze_listings') }}
{% if is_incremental() %}
    WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}