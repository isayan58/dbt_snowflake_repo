{% set nights_booked = 1%}

SELECT * from {{ source('staging', 'bookings') }}
{% if nights_booked = 1 %}
WHERE nights_booked = {{ nights_booked }}  
{% else %}
WHERE nights_booked >= {{ nights_booked }}
{% endif %}