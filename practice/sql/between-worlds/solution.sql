select us.user_id,
       de.os_name,
       de.device_type,
       us.session_start
from user_sessions us
join devices de
on us.device_id = de.device_id
where us.user_id in
(select us2.user_id
from user_sessions us2
join devices de2
on us2.device_id = de2.device_id
group by us2.user_id
having count(distinct de2.device_type) > 1
);
