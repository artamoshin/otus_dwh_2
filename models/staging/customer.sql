{{
    config (
        order_by='C_CUSTKEY'
    )
}}

SELECT * FROM {{ source('dbgen', 'customer') }}
