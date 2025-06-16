
  
    

  create  table "ny_taxi"."public"."trip_stats__dbt_tmp"
  
  
    as
  
  (
    

SELECT
    AVG(trip_distance)
FROM
    public.green_taxi_trips 
GROUP BY
    vendor
  );
  