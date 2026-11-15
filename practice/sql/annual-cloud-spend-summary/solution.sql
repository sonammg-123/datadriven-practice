select
   extract(year from bill_date) as fiscal_year,
   sum(amount) as total_spend,
   count(distinct svc_name) as unique_name
from cloud_costs
group by fiscal_year
order by fiscal_year
