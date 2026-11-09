{{ config(materialized='incremental',
    unique_key='key_hash')
}}

SELECT host_id,
    host_name,
    {{ host_quality('response_rate') }} AS host_quality,
    created_at,
    {{ key_hash(['host_id']) }} AS key_hash
FROM {{ ref('bronze_hosts') }}
{% if is_incremental() %}
    WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}