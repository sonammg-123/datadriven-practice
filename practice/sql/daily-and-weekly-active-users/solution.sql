select
    date(session_start),
    count(distinct user_id)
from user_sessions
group by date(session_start)
order by date(session_start);
