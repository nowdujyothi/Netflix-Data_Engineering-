
{{config(materialized='table')}}


with cte1 as (
    select initcap(t.tag) as tag,
           t.movie_id,
           t.tag_timestamp   
        from {{ref('st_TAGS')}} t  
        join 
        {{ref('st_movies')}} m on t.movie_id = m.movie_id 
),

cte2 as (
    select movie_id, 
           tag,
           tag_timestamp,
           row_number() over(partition by  movie_id,tag order by tag_timestamp)
         as row_num 
from cte1
)
select movie_id,
       tag,
       tag_timestamp,
from cte2
where row_num=1

