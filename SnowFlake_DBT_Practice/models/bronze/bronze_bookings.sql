{{ config(materialized='incremental') }}

{% set incremental_col = 'CREATED_AT' %}

SELECT * from {{ source('staging', 'bookings') }}
{% if is_incremental() %}
    WHERE {{ incremental_col }} > (SELECT COALESCE(MAX({{ incremental_col }}), '1900-01-01') from {{ this }})
{% endif %}