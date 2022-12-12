/*
==================
Table
==================
This table shows the sales pipeline to identify conversion, leakage, and stale referrals that could become 
*/

with data as (
select
  sales_contact_country,
  Sales_Contact_Name,
  count(case when ref_status = "successful" then 1 end) as Sucesses,
  count(case when ref_status = "pending" then 1 end) as In_Progress,
  count(case when ref_status = "disinterested" then 1 end) as Uninterested
  
  from {{ ref('mart_full_referrals') }}


group by 1,2
)

select * from data

/*
==================
Analysis
==================
1) Tulip has a lot of deals in progress, but very few successes. Do they need to update the system?
2) Apple has a lot of deals in progress, what could we do to help them convert?
3) Potato, who has left has a lot of deails in progress, are we able to salvage them?
*/
