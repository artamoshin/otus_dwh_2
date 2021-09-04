{{
    config (
        order_by=['LO_ORDERDATE', 'LO_ORDERKEY'],
        partition_by='toYear(LO_ORDERDATE)'
    )
}}

SELECT * FROM {{ source('dbgen', 'lineorder') }}
