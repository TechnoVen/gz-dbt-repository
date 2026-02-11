{{ config(materialized='view') }}

with source as (
    select * from {{ source('raw', 'product') }}
),

renamed as (
    select
        products_id,  -- ✅ Only column available besides purchSE_PRICE
        CAST(purchSE_PRICE AS FLOAT64) as purchase_price  -- ✅ Fix typo + cast
    from source
)

select * from renamed