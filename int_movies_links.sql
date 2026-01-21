{{config(materialized='table')}}


select 
  m.movie_id,
  TRIM(REGEXP_SUBSTR(m.title, '^[^(]+')) AS movie_name,
  CAST(REGEXP_SUBSTR(m.title, '\\d{4}') AS INT) AS release_year,
  m.genres,
  l.imdb_id,
  l.tmdb_id
FROM {{ ref('st_movies') }} m
JOIN {{ ref('st_LINKS') }} l
  ON m.movie_id = l.movie_id

