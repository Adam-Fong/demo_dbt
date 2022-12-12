/*
==================
Table
==================
This table shows the amount of successful referrals by sales associate by year
*/

with data as (
select
  sales_contact_country,
  Sales_Contact_Name,
  YEAR(ref_created_at) as Year_Referral,
  count(*) as num_referrals
  
  from {{ ref('mart_full_referrals') }}

where ref_status = "successful"

group by 1,2,3
)

select * from data order by Year_Referral, num_referrals desc

/*
==================
Analysis
==================
1) One of the more successful sales contact has left potato, and most likely have taken their contacts with them
2) How do we utilise Lion's sales tactics to increase sales accross the team?
*/
