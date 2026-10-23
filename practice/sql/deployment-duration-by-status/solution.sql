select
  lower(trim(svc_name)) as svc_name,
  lower(trim(status)) as status,
  sum(dur_secs) as total_duration
from deploy_logs
group by 
  lower(trim(svc_name)),
  lower(trim(status))
order by 
  svc_name, 
  status;
