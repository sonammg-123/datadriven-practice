with case1 as ( select endpoint ,
                       count(*) as call_count
                from api_calls
                where lower(method) = 'post'
                group by endpoint
                ),
 case2 as (select endpoint,
                  call_count,
                  dense_rank() over (order by call_count) as rnk
                from case1
            )
  select endpoint,
         call_count,
         rnk
  from case2
  where rnk <= 3
  order by rnk , endpoint;
