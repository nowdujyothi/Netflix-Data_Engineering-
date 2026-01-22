


{{ config(materialized='table') }}

SELECT
    m.movie_name,
    m.release_year,
    TRIM(g.value) AS genre
FROM {{ ref('int_movies_links') }} m,
LATERAL SPLIT_TO_TABLE(m.genres, '|') g
