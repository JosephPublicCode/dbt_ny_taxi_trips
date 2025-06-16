<<<<<<< HEAD
# dbt_ny_taxi_trips
=======
## Command

-h: host
-p: port
-U: User
-d: database
-c: Command

<!-- opens the database to allow queries to be run-->

psql -h localhost -p 5432 -U root -d ny_taxi

<!-- Then run query with a colon at the end -->

<!-- runs the specific query -->
psql -h localhost -p 5432 -U root -d ny_taxi -c "SELECT
    AVG(yt.trip_distance)
FROM
    public.yellow_taxi_data yt
GROUP BY
    yt.vendor"

dbt run 
dbt debug


DBT testing: 

dbt test - basic tests to check the conditions and values within columns.

dbt run-operation __name_of_macro__ --args __arguments_of_the_function__

<!-- get the documentationx -->
dbt docs generate 


dbt tests: 
- can be run. 
- how do we do this? 

dbt flow view in dbt core - is this possible? 
>>>>>>> b7fc553 (initial commit)
