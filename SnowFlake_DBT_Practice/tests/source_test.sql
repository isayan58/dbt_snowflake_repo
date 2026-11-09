{{ config(severity= 'WARN') }}
{# {{ config(severity= 'ERROR') }} #}
Select 1 from {{ source('staging', 'bookings') }}
where BOOKING_AMOUNT<200