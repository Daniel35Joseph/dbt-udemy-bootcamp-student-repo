{{
    config(
        materialized = 'table'
    )
}}

WITH fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews') }}
),
full_moon_dates AS (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}
)

SELECT 
    r.*,
    CASE
        WHEN fm.full_moon_date IS NULL THEN 'not full moon'
        ELSE 'full moon'
    END AS is_full_moon
FROM 
    fct_reviews r
    LEFT JOIN seed_full_moon_dates fm ON (r.review_date = DATEADD(DAY, 1, fm.full_moon_date))