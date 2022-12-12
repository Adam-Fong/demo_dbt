/*
==================
Table
==================
This table shows the sales pipeline to identify conversion, leakage, and stale referrals that could become something
*/

with data as (
select
  partner_id,
  partner_type,
  count(distinct ref_company_id) as referrals,
  count(distinct ref_company_id)/sum(count(distinct ref_company_id)) over() as ref_proportion
  
  
  from {{ ref('mart_full_referrals') }}


group by 1,2
)

select * from data order by referrals desc

/*
==================
Analysis
==================
1) A large proportion of our business comes from a handful of key partners. This exposes our risk as a business
*/