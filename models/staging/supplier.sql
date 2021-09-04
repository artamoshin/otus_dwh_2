{{
    config (
        order_by='S_SUPPKEY'
    )
}}

SELECT * FROM {{ source('dbgen', 'supplier') }}
