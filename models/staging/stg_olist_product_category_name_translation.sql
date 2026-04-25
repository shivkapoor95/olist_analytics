{{ config(materialized='view') }}
SELECT *
FROM {{source('olist','product_category_name_translation')}}