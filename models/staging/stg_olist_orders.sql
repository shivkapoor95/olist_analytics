{{ config(materialized='view') }}
select order_id,
customer_id,
order_status,
CAST(order_purchase_timestamp as timestamp) as order_purchase_timestamp ,
CAST(order_approved_at as timestamp) as order_approved_at,
CAST(order_delivered_carrier_date as timestamp) as order_delivered_carrier_date,
CAST(order_delivered_customer_date as timestamp) as order_delivered_customer_date,
CAST(order_estimated_delivery_date as date) as order_estimated_delivery_date
from  {{source('olist','olist_orders_dataset')}}    