select
   count(distinct u.user_id) as active_users
from users u
join transactions t
on u.user_id = t.user_id
where u.account_status = 'active'
 and t.transaction_date >= '2026-04-01'
  and t.transaction_date < '2026-05-01'
