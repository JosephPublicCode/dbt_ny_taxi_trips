

SELECT
    AVG(trip_distance)
FROM
    public.green_taxi_trips 
GROUP BY
    vendor