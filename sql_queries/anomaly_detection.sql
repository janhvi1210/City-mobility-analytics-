WITH stats AS (
    SELECT
        route_id,
        AVG(delay_minutes) AS avg_delay,
        STDDEV(delay_minutes) AS std_delay
    FROM fact_trip_performance
    GROUP BY route_id
)
SELECT
    f.trip_id,
    f.route_id,
    f.delay_minutes
FROM fact_trip_performance f
JOIN stats s ON f.route_id = s.route_id
WHERE f.delay_minutes > s.avg_delay + 2 * s.std_delay;