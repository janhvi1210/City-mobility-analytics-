This project simulates a real-time city mobility analytics platform.

Data flows from operational OLTP tables (GPS events, trips)
into an analytics warehouse modeled using a star schema.

Near real-time queries operate on recent timestamps,
while historical analysis is performed on aggregated fact tables.