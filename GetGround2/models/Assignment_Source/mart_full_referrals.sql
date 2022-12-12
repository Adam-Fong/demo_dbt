with  referrals as (

  select * 
  from {{ ref('intermediate_referrals') }}

)
,   sales_people as (

  select * 
  from {{ ref('intermediate_sales_people') }}

)
,  partners as (

  select * 
  from {{ ref('intermediate_partners') }}

)
, main as (

  select 
    r.id as referral_id,
    r.created_at as ref_created_at,
    r.updated_at as ref_status_updated_at,
    r.company_id as ref_company_id,
    r.partner_id,
    r.consultant_id as ref_consultant_id,
    r.status as ref_status,
    CASE WHEN is_outbound = 1 THEN TRUE ELSE FALSE END as is_outbound,
    p.created_at as partner_start_date,
    p.partner_type,
    COALESCE(s.name, CONCAT(p.lead_sales_contact, " (inactive)")) as Sales_Contact_Name,
    COALESCE(s.country, "unassigned") as Sales_Contact_Country
  from referrals as r
    left join partners p on p.id = r.partner_id
    left join sales_people s on s.name = p.lead_sales_contact

)

select * from main