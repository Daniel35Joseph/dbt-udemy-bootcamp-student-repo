SELECT r.review_date
FROM {{ ref('fct_reviews') }} r
INNER JOIN {{ref('dim_listings_cleansed')}} l
WHERE 1=1
AND (
    r.review_date < l.created_at
    AND r.listing_id = l.listing_id
) 
LIMIT 10