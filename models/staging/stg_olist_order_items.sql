{{ config(materialized='view') }}
SELECT order_id,
       order_item_id, 
       product_id,
       seller_id,
       CAST(shipping_limit_date as date) as shipping_limit_date,
       price,
       freight_value
FROM {{source('olist','olist_order_items_dataset')}}
