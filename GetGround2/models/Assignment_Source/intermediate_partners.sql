with  partners as (

  select * 
  from {{ ref('staging_partners') }}

)

, base as (

    select 
      p.id,
      from_unixtime(p.created_at/1000000000) as created_at,
      from_unixtime(p.updated_at/1000000000) as updated_at,
      p.partner_type,
      p.lead_sales_contact,
      CURRENT_TIMESTAMP() as data_pulled
    from partners as p
    
)

select * from base