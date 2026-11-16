select
     user_id,
     sum(total_amount) as lifetime_spend,
     count(*) as tx_count
from transactions
where total_amount > 0
group by user_id
having count(*) >= 13
order by lifetime_spend desc;
