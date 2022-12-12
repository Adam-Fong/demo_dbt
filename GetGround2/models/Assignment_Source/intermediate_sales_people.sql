with  sales_people as (
    select *
    from {{ ref('staging_sales_people') }}

)

, base as (

    select 
      s.name,
      s.country,
      CURRENT_TIMESTAMP() as data_pulled
    from sales_people as s

)

select * from base