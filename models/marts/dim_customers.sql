{{ config(materialized='table') }}

with unique_cust as(

SELECT customer_id,
customer_unique_id,
customer_zip_code_prefix,
customer_city,
customer_state,
ROW_NUMBER() OVER ( PARTITION BY customer_unique_id ORDER BY customer_id) as row_num
FROM {{ref('stg_olist_customers')}}
)
SELECT 
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM unique_cust 
WHERE row_num = 1