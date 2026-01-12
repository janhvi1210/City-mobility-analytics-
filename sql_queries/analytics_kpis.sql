SELECT
    r.route_name,
    COUNT() AS total_trips,
    SUM(CASE WHEN delay_minutes = 5 THEN 1 ELSE 0 END)  100.0  COUNT() AS on_time_percentage
FROM fact_trip_performance f
JOIN dim_route r ON f.route_id = r.route_id
GROUP BY r.route_name;