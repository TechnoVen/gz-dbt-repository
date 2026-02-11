{{ config(materialized='view') }}

with source as (
    select * from {{ source('raw', 'ship') }}
),

renamed as (
    select
        orders_id,
        shipping_fee,          -- ✅ Keep only one shipping_fee column
        logCost as logcost,    -- ✅ Standardize casing
        CAST(ship_cost AS FLOAT64) as ship_cost
    from source
)

select * from renamed