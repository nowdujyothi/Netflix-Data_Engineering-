
{{ config(materialized = 'table') }}
with raw_movies as (
    select * from netflix.raw.raw_movies
)
select distinct MOVIEID as movie_id,
                TITLE,
                GENRES
    from raw_movies
