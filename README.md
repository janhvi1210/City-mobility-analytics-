
# 🚦 Real-Time City Mobility Analytics Platform

## One-line Pitch
A SQL-based near real-time analytics warehouse that ingests transit and traffic data,
models it in a star schema, and enables operational monitoring and congestion analysis
for a city transport authority.

## Problem Statement
City transport operators struggle to:
- Monitor route delays in real time
- Identify congestion hotspots
- Measure SLA compliance (on-time performance)
- Understand peak-hour demand patterns

## Architecture Overview
- OLTP layer stores raw operational data (GPS pings, trips)
- Analytics warehouse transforms data into fact/dimension tables
- SQL queries power real-time monitoring and historical analysis

## Tech Stack
- PostgreSQL
- SQL (CTEs, window functions, time-based analytics)
- Python (optional ETL simulation)

## Key Features
- Near real-time route monitoring (last 30 minutes)
- On-time performance KPIs
- Anomaly detection using statistical baselines in SQL
- Star schema analytics warehouse
- Indexed and timestamp-partition-friendly design

## Project Structure
schema/          → OLTP and warehouse DDL  
etl/             → ETL logic (SQL-based)  
sql_queries/     → Analytics and monitoring queries  
docs/            → Architecture notes  

## Example Business Questions Answered
- Which routes are delayed during peak hours?
- What is the on-time performance per route?
- Which trips exhibit abnormal delays?

## Future Improvements
- Live ingestion via Kafka
- Dashboard integration (Power BI / Tableau)
- Predictive delay modeling using ML
