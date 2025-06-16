

SELECT
    AVG(yt.trip_distance)
FROM
    public.yellow_taxi_data yt
GROUP BY
    yt.vendor