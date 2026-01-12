SELECT
    r.route_name,
    AVG(g.speed_kmph) AS avg_speed
FROM gps_events g
JOIN vehicles v ON g.vehicle_id = v.vehicle_id
JOIN trips t ON t.vehicle_id = v.vehicle_id
JOIN routes r ON t.route_id = r.route_id
WHERE g.event_time >= NOW() - INTERVAL '30 minutes'
GROUP BY r.route_name;