
/*

select query
  , total_bytes_processed/1024/1024 as total_bytes_processed_mb
  , total_bytes_billed/1024/1024 as total_bytes_billed_mb
from `bq-dalykeliai`.`region-europe-west4`.INFORMATION_SCHEMA.JOBS
where job_id = 'bquxjob_3abdba62_1969ca9c300'

*/

select datetime_trunc(creation_time, month) as MONTH
  , user_email
  , count(distinct job_id) as query_cnt
  , sum(total_bytes_processed)/1024/1024 as total_bytes_processed_mb
  , sum(total_bytes_billed)/1024/1024 as total_bytes_billed_mb
from `bq-dalykeliai`.`region-europe-west4`.INFORMATION_SCHEMA.JOBS
where 1=1 
and creation_time >= '2024-01-01 00:00:00'
group by 1, 2
order by 1, total_bytes_billed_mb desc

