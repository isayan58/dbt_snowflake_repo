{{
    config(
        materialized='ephemeral'
    )
}}

WITH listings AS 
(
    SELECT 
    LISTING_ID,
       PRICE_PER_NIGHT, 
       ROOM_TYPE, CITY, LISTING_CREATED_AT
    FROM 
        {{ ref('obt') }}
)
SELECT * FROM listings