
  
    

  create  table "ny_taxi"."public"."trip_stats__dbt_tmp"
  
  
    as
  
  (
    

SELECT
    AVG(yt.trip_distance)
FROM
    public.yellow_taxi_data yt
GROUP BY
    yt.vendor
  );
  