
  create view "ny_taxi"."public"."stg_yellow_tripdata__dbt_tmp"
    
    
  as (
    
 
with tripdata as 
(
  select *,
    row_number() over(partition by vendorid, tpep_pickup_datetime) as rn
  from "ny_taxi"."public"."yellow_taxi_trips"
  where vendorid is not null 
)

select
   -- identifiers
    md5(cast(coalesce(cast(vendorid as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(tpep_pickup_datetime as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as tripid,    
    
    
    cast(vendorid as integer)
 as vendorid,
    
    
    cast(ratecodeid as integer)
 as ratecodeid,
    
    
    cast(pulocationid as integer)
 as pickup_locationid,
    
    
    cast(dolocationid as integer)
 as dropoff_locationid,

    -- timestamps
    cast(tpep_pickup_datetime as timestamp) as pickup_datetime,
    cast(tpep_dropoff_datetime as timestamp) as dropoff_datetime,
    
    -- trip info
    store_and_fwd_flag,
    
    
    cast(passenger_count as integer)
 as passenger_count,
    cast(trip_distance as numeric) as trip_distance,
    -- yellow cabs are always street-hail
    1 as trip_type,
    
    -- payment info
    cast(fare_amount as numeric) as fare_amount,
    cast(extra as numeric) as extra,
    cast(mta_tax as numeric) as mta_tax,
    cast(tip_amount as numeric) as tip_amount,
    cast(tolls_amount as numeric) as tolls_amount,
    cast(0 as numeric) as ehail_fee,
    cast(improvement_surcharge as numeric) as improvement_surcharge,
    cast(total_amount as numeric) as total_amount,
    coalesce(
    
    cast(payment_type as integer)
,0) as payment_type,
    case 
    
    cast(payment_type as integer)
  
        when 1 then 'Credit card'
        when 2 then 'Cash'
        when 3 then 'No charge'
        when 4 then 'Dispute'
        when 5 then 'Unknown'
        when 6 then 'Voided trip'
        else 'EMPTY'
    end as payment_type_description
from tripdata
where rn = 1

-- dbt build --select <model.sql> --vars '{'is_test_run: false}'

  );