CREATE TABLE dim_date (
    date_key DATE PRIMARY KEY,
    day INT,
    month INT,
    year INT,
    weekday VARCHAR(10),
    is_peak BOOLEAN
);

CREATE TABLE dim_route (
    route_id INT PRIMARY KEY,
    route_name VARCHAR(50)
);

CREATE TABLE dim_vehicle (
    vehicle_id INT PRIMARY KEY,
    vehicle_type VARCHAR(20),
    capacity INT
);

CREATE TABLE fact_trip_performance (
    trip_id INT PRIMARY KEY,
    route_id INT,
    vehicle_id INT,
    date_key DATE,
    scheduled_duration INT,
    actual_duration INT,
    delay_minutes INT,
    FOREIGN KEY (route_id) REFERENCES dim_route(route_id),
    FOREIGN KEY (vehicle_id) REFERENCES dim_vehicle(vehicle_id),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);