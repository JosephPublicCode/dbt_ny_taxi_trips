

select 
    locationid, 
    borough, 
    zone, 
    replace(service_zone,'Boro','Green') as service_zone 
from "ny_taxi"."public"."taxi_zone_lookup"