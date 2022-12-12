with source_data as (

    select *
    from {{ ref('sales_people') }}

)

select *
from source_data