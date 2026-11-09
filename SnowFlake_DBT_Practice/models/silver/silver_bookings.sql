{{
    config(materialized ='incremental',
    unique_key='key_hash')
}}

SELECT
    booking_id,
    listing_id,
    booking_date,
    {{ multiply(multiply('nights_booked', 'booking_amount', 2) ~ ' + cleaning_fee + service_fee', '1.01', 2) }} AS total_amount,
    booking_status,
    created_at,
    {{ key_hash(['booking_id']) }} AS key_hash
FROM {{ ref('bronze_bookings') }}
{% if is_incremental() %}
    WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}