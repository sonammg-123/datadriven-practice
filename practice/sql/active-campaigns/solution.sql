select
     ad_campaign,
     count(*) as impressions,
     SUM(revenue) as total_revenue,
     Round(sum(clicked) * 100.0 / count(*) , 1) as clicks
from ad_impressions
group by ad_campaign
having count(*) > 15
order by clicks desc , ad_campaign;
