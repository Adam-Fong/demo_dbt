select 1 as id
union all
select * from {{ ref('node_0') }}
union all
select * from {{ ref('node_3') }}
union all
select * from {{ ref('node_6') }}
union all
select * from {{ ref('node_7') }}
union all
select * from {{ ref('node_127') }}
union all
select * from {{ ref('node_193') }}
union all
select * from {{ ref('node_241') }}
union all
select * from {{ ref('node_727') }}
union all
select * from {{ ref('node_839') }}
