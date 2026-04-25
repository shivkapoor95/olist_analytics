{{ config(materialized='table') }}

with order_items as (
    select * from {{ ref('stg_olist_order_items') }}
),

orders as (
    select
        order_id,
        customer_id,
        order_status,
        order_purchase_timestamp
    from {{ ref('stg_olist_orders') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['oi.order_id', 'oi.order_item_id', 'oi.product_id', 'oi.seller_id']) }} as order_item_sk,
        oi.order_id,
        oi.order_item_id,
        oi.product_id,
        oi.seller_id,
        o.customer_id,
        o.order_status,
        o.order_purchase_timestamp,
        oi.shipping_limit_date,
        oi.price,
        oi.freight_value,
        oi.price + oi.freight_value as total_item_value
    from order_items oi
    left join orders o on oi.order_id = o.order_id
)

Select * from final