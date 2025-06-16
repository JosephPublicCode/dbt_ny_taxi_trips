
  create view "ny_taxi"."public"."trips__dbt_tmp"
    
    
  as (
    

SELECT
    DISTINCT(yt.pulocationid) AS unique_location_id
FROM 
    public.yellow_taxi_data yt
  );