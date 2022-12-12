==========
Table
==================
This table shows the sales pipeline to identify conversion, leakage, and stale referrals that could become something
*/

with data as (
select
  partner_type,
  count(distinct ref_company_id) as referrals,
  count(distinct ref_company_id)/sum(count(distinct ref_company_id)) over() as ref_proportion
  
  
from marts.referral_detail

where ref_status = "successful"


group by 1
)

select * from data order by referrals desc

/*
==================
Analysis
==================
1) A large proportion of our business comes from referrals of Agents or "others" Are we able to define the "others" category to target them as well?
*/