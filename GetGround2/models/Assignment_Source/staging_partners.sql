with source_data as (

    select *
    from {{ ref('partners') }}

)

select *
from source_data