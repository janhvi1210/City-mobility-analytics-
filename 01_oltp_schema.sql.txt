CREATE TABLE vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    vehicle_type VARCHAR(20),
    capacity INT,
    operator_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE stops (
    stop_id SERIAL PRIMARY KEY,
    stop_name VARCHAR(100),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    zone VARCHAR(50)
);

CREATE TABLE routes (
    route_id SERIAL PRIMARY KEY,
    route_name VARCHAR(50),
    origin_stop_id INT REFERENCES stops(stop_id),
    destination_stop_id INT REFERENCES stops(stop_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE trips (
    trip_id SERIAL PRIMARY KEY,
    route_id INT REFERENCES routes(route_id),
    vehicle_id INT REFERENCES vehicles(vehicle_id),
    scheduled_start TIMESTAMP,
    scheduled_end TIMESTAMP,
    actual_start TIMESTAMP,
    actual_end TIMESTAMP,
    trip_status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE gps_events (
    event_id BIGSERIAL PRIMARY KEY,
    vehicle_id INT REFERENCES vehicles(vehicle_id),
    event_time TIMESTAMP NOT NULL,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    speed_kmph DECIMAL(5,2),
    source VARCHAR(20)
);

CREATE INDEX idx_gps_event_time ON gps_events(event_time);
CREATE INDEX idx_trip_times ON trips(actual_start, actual_end);
