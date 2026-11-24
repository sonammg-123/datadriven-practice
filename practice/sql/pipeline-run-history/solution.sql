select
      pipe_name,
      min(start_at) as first_run,
      max(start_at) as last_run,
      count(distinct date_trunc('month' , start_at)) as active_months
from data_pipes
group by pipe_name;
