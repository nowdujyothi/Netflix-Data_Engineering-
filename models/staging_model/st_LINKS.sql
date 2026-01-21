
{{ config(materialized = 'table') }}
WITH raw_links AS (
  SELECT * FROM netflix.RAW.RAW_LINKS
)

SELECT
  movieId AS movie_id,
  imdbId AS imdb_id,
  tmdbId AS tmdb_id
FROM raw_links