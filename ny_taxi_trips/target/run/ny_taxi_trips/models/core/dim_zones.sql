
  
    

  create  table "ny_taxi"."public"."dim_zones__dbt_tmp"
  
  
    as
  
  (
    

select 
    locationid, 
    borough, 
    zone, 
    replace(service_zone,'Boro','Green') as service_zone 
from "ny_taxi"."public"."taxi_zone_lookup"
  );
  