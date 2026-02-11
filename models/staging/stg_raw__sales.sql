{{ config(materialized='view') }}

with source as (
    select * from {{ source('raw', 'sales') }}
),

renamed as (
    select
        orders_id,
        date_date,
        pdt_id as products_id,  -- ✅ Rename to match product table
        revenue,
        quantity
    from source
)

select * from renamed