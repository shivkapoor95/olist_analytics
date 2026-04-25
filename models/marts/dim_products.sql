{{ config(materialized='table') }}

select
    p.product_id,
    p.product_name_length,
    p.product_description_length,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm,
    pt.product_category_name_english
from {{ ref('stg_olist_products') }} p
left join {{ ref('stg_olist_product_category_name_translation') }} pt
    on p.product_category_name = pt.product_category_name