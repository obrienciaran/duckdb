# duckdb
Code related to DuckDB

## Getting started

-- Create a table in the main schema
CREATE TABLE test_table AS select * from read_csv_auto('/Users/ciaranobrien/Desktop/Work/Quack/data.csv')
SHOW TABLES;
select * from test_table

--Create a new schema and add the data.csv data to it as a table
CREATE SCHEMA ciaran_data;
CREATE TABLE ciaran_data.test_table AS select * from read_csv_auto('/Users/ciaranobrien/Desktop/Work/Quack/data.csv')

-- Check schema info
select * from INFORMATION_SCHEMA.tables

-- Some simple analytics
-- 1. Counting
select count(*) from ciaran_data.test_table;

--- 2. Window functions
WITH ranking AS
         (SELECT *, RANK() OVER (PARTITION BY employee, department ORDER BY salary Desc) AS rnk
          FROM ciaran_data.test_table)
SELECT employee, department, salary
FROM ranking
WHERE rnk = 1
