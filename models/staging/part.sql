{{
    config (
        order_by='P_PARTKEY'
    )
}}

SELECT * FROM {{ source('dbgen', 'part') }}
