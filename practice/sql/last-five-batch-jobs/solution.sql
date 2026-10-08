select  job_id,
         job_name,
         status,
         rows_done,
         started,
         ended,
         priority,
         retries
from
  batch_jobs
order by job_id desc
limit  5;
