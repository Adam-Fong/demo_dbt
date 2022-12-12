with source_data as (

    select *
    from {{ ref('referrals') }}

)

select *
from source_data