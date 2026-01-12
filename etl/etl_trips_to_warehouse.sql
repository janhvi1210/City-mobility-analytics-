INSERT INTO dim_route
SELECT DISTINCT route_id, route_name
FROM routes
ON CONFLICT (route_id) DO NOTHING;

INSERT INTO dim_vehicle
SELECT DISTINCT vehicle_id, vehicle_type, capacity
FROM vehicles
ON CONFLICT (vehicle_id) DO NOTHING;

INSERT INTO dim_date
SELECT DISTINCT
    DATE(actual_start),
    EXTRACT(DAY FROM actual_start),
    EXTRACT(MONTH FROM actual_start),
    EXTRACT(YEAR FROM actual_start),
    TO_CHAR(actual_start, 'Day'),
    CASE WHEN EXTRACT(HOUR FROM actual_start) BETWEEN 7 AND 10 THEN TRUE ELSE FALSE END
FROM trips
WHERE actual_start IS NOT NULL
ON CONFLICT (date_key) DO NOTHING;

INSERT INTO fact_trip_performance
SELECT
    t.trip_id,
    t.route_id,
    t.vehicle_id,
    DATE(t.actual_start),
    EXTRACT(EPOCH FROM (t.scheduled_end - t.scheduled_start))/60,
    EXTRACT(EPOCH FROM (t.actual_end - t.actual_start))/60,
    EXTRACT(EPOCH FROM (t.actual_end - t.scheduled_end))/60
FROM trips t
WHERE t.actual_end IS NOT NULL
ON CONFLICT (trip_id) DO NOTHING;
