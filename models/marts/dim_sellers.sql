{{ config(materialized='table') }}

SELECT * 
FROM {{ref('stg_olist_sellers')}}