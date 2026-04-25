{{ config(materialized='table') }}

with orders as (
    select * from {{ ref('stg_olist_orders') }}
),

payments as (
    select
        order_id,
        sum(payment_value) as total_payment_value,
        max(payment_installments) as payment_installments,
        max(payment_type) as payment_type
    from {{ ref('stg_olist_order_payments') }}
    group by order_id
),

reviews as (
    select
        order_id,
        avg(review_score) as avg_review_score
    from {{ ref('stg_olist_order_reviews') }}
    group by order_id
),

final as (
    select
        o.order_id,
        o.customer_id,
        o.order_status,
        o.order_purchase_timestamp,
        o.order_delivered_customer_date,
        o.order_estimated_delivery_date,
        p.total_payment_value,
        p.payment_type,
        p.payment_installments,
        r.avg_review_score,
        {{ datediff('o.order_purchase_timestamp', 'o.order_delivered_customer_date') }} as delivery_time_days,
        {{ datediff('o.order_purchase_timestamp', 'o.order_estimated_delivery_date') }} as estimated_delivery_days,
        {{ datediff('o.order_estimated_delivery_date', 'o.order_delivered_customer_date') }} as delivery_delay_days
    from orders o
    left join payments p on o.order_id = p.order_id
    left join reviews r on o.order_id = r.order_id
)

select * from final