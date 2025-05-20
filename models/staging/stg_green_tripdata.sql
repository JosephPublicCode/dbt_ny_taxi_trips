WITH 

source AS (
    SELECT * FROM {{ source('staging', 'green_tripdata') }}

), 

renamed AS (
    SELECT 
        vendorid, 
        lpep_pickup_datetime, 
        lpep_dropoff_datetime, 
        store_and_fwd_flag, 
        ratecodeid, 
        passenger_count, 
        trip_distance, 
        fare_amount, 
        extra, 
        mta_tax, 
        tip_amount, 
        tolls_amount, 
        ehail_fee,
        total_amount, 
        payment_type,
        {{get_payment_type_description('payment_type')}} AS payment_description,
        trip_type, 
        improvement_surcharge, 
        pulocationid,
        dolocationid

    FROM source

)

SELECT * 
FROM renamed