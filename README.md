# Duckdb 🦆
This is my personal repository for keeping code related to DuckDB

### Getting started: Create a connection

1. Download the DuckDB driver from [Maven] (https://search.maven.org/artifact/org.duckdb/duckdb_jdbc)

2. In DataGrip/DataSpell, create a new Driver configuration using the downloaded jar file.
First, click 'Add Database' on the right hand side of the IDE. Then click the `+` icon, followed by `Data Source`, followed by DuckDb. You will then see the below screen. Click DuckDB, as show in the green box.

<img width="748" alt="Screenshot 2023-01-14 at 23 48 29" src="https://user-images.githubusercontent.com/31419980/212500476-845c207e-a9d3-4778-a268-0a9513e50085.png">

You will now see the page in the next screenshot. Here, you can point to the .jar file you downloaded. Replicate the text as per the screenshot, and test the connection. You should be ready to go now.

<img width="798" alt="Screenshot 2023-01-14 at 23 47 22" src="https://user-images.githubusercontent.com/31419980/212500421-d5a0d397-f5fe-45f9-b32b-44f9befc631d.png">

3. Right click the DuckDB connection -> Navigation -> Jump to Query Console. You can now query using DuckDB. But first, we need some data.


<p align="center">
<img src="https://user-images.githubusercontent.com/31419980/212500540-8264a6d6-73d2-4c90-879f-2cb48e6acb35.png"  alt="Example of how to attach a directory in DataSpell." width="632" height="500">
</p>

---
### Getting started: Adding data


- Create a table in the main schema
```
CREATE TABLE test_table AS select * from read_csv_auto('/Users/ciaranobrien/Desktop/Work/Quack/data.csv')
SHOW TABLES;
select * from test_table
```

- Create a new schema and add the data.csv data to it as a table
```
CREATE SCHEMA ciaran_data;
CREATE TABLE ciaran_data.test_table AS select * from read_csv_auto('/Users/ciaranobrien/Desktop/Work/Quack/data.csv')
```

- Check schema info
```
select * from INFORMATION_SCHEMA.tables
```

#### Some simple analytics
- 1. Counting
```
select count(*) from ciaran_data.test_table
```

-  2. Window functions
```
WITH ranking AS
         (SELECT *, RANK() OVER (PARTITION BY employee, department ORDER BY salary Desc) AS rnk
          FROM ciaran_data.test_table)
SELECT employee, department, salary
FROM ranking
WHERE rnk = 1
```
