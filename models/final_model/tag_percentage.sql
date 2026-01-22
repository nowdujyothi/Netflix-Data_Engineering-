



{{ config(materialized='table') }}

SELECT
    tag,
    tag_per AS tag_percentage
FROM {{ ref('int_movies_tags') }}
WHERE tag_per > 0.5
group by tag,tag_percentage
