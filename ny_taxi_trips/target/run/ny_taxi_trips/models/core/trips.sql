
  create view "ny_taxi"."public"."trips__dbt_tmp"
    
    
  as (
    

SELECT
    DISTINCT pulocationid AS unique_location_id
FROM 
    public.green_taxi_trips
  );