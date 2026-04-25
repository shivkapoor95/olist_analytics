{{ config(materialized='view') }}

WITH reviews_with_row_num AS (
    select
        review_id,
        order_id,
        review_score,
        review_comment_title,
        review_comment_message,
        CAST(review_creation_date as date) as review_creation_date,
        CAST(review_answer_timestamp as timestamp) as review_answer_timestamp,
        ROW_NUMBER() OVER (PARTITION BY review_id ORDER BY review_answer_timestamp DESC) as row_num
    from {{ source('olist', 'olist_order_reviews_dataset') }}
)

select
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp
from reviews_with_row_num
where row_num = 1