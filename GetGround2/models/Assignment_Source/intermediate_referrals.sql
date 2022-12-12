with  referrals as (

  select *
  from {{ ref('staging_referrals') }}

)

, base as (

    select 
      r.id,
      from_unixtime(r.created_at/1000000000) as created_at,
      from_unixtime(r.updated_at/1000000000) as updated_at,
      r.company_id,
      r.partner_id,
      r.consultant_id,
      r.status,
      r.is_outbound,
      CURRENT_TIMESTAMP() as data_pulled
    from referrals as r

)

select * from base