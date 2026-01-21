{{config(materialized='table')}}


select
  gs.movie_id,
  gt.tag as genome_tag,
  gs.relevance
from {{ ref('st_GENOME_SCORES') }} gs
join {{ ref('st_GENOME_TAGS') }} gt
  on gs.tag_id = gt.tag_id
