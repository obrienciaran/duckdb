# DuckDB 🦆

This is my personal repository for keeping code and instructions related to DuckDB.

---
# What is the purpose of this repository? 🤔

Having worked in consultancy for a long time, particularly on government contracts, I am very aware of how prevalent Microsoft Excel is being used to handle .csv files. Being a data scientist, I felt my brain slowly turning into mush working with Excel on a daily basis. After using DuckDB, I immediately saw the benefit for analysts in the same position as I was.

DuckDB is a severless OLAP database management system and has been described as SQLite for analytics - and it can read .csv files directly. What does this mean? It means anybody can run their own SQL engine on their own computer for performing analytics. This means:

- Goodbye Excel;
- No need for managing a server;
- No dependencies;
- Faster than Pandas/Python;
- Larger than memory processing;
- Lightning fast analytics;
- Common SQL language; and,
- Run analytics anywhere: on your laptop, in the browser, on a cloud VM, in a cloud function, as part of a Python notebook, R script, Javascript app. all of the following are legitimate queries with DuckDB; a parquet file in a S3 bucket, a local parquet file, a Pandas dataframe in a notebook, or a browser query:

```
SELECT AVG(trip_distance) FROM 's3://yellow_tripdata_20[12]*.parquet'
SELECT * FROM '~/local/files/file.parquet'
SELECT * FROM dataframe
SELECT * FROM 'https://shell.duckdb.org/data/tpch/0_01/parquet/lineitem.parquet'

```


---

## Getting started: Create a connection 🔗

1. Install DuckDB

```
pip install duckdb==0.6.1
````

2. Download the DuckDB driver from [Maven](https://search.maven.org/artifact/org.duckdb/duckdb_jdbc).

3. In DataGrip/DataSpell, create a new Driver configuration using the downloaded jar file.
First, click 'Add Database' on the right hand side of the IDE. Then click the `+` icon, followed by `Data Source`, followed by DuckDb. You will then see the below screen. Click DuckDB, as show in the green box.


<p align="center">
<img src="https://user-images.githubusercontent.com/31419980/212500476-845c207e-a9d3-4778-a268-0a9513e50085.png"  alt="Example of how to add DuckDB as a datasource" width="632" height="500">
</p>

You will now see the page in the next screenshot. Here, you can point to the .jar file you downloaded. Replicate the text as per the screenshot, and test the connection. You should be ready to go now.


<p align="center">
<img src="https://user-images.githubusercontent.com/31419980/212500421-d5a0d397-f5fe-45f9-b32b-44f9befc631d.png"  alt="Example of how to add the .jar file to the DuckDB datasource which is the DuckDB driver." width="632" height="500">
</p>


4. Right click the DuckDB connection -> Navigation -> Jump to Query Console. You can now query using DuckDB. But first, we need some data.


<p align="center">
<img src="https://user-images.githubusercontent.com/31419980/212500694-2e65947a-b036-4585-b090-fe91056d78dd.png"  alt="Example of how to begin querying using DuckDB." width="1000" height="450">
</p>

---

## Getting started: Adding data 💾


- Create a table in the main schema
```
CREATE TABLE test_table AS select * FROM read_csv_auto('/Users/ciaranobrien/Desktop/Work/Quack/data.csv')
SHOW TABLES;
SELECT * FROM test_table
```

- Create a new schema and add the data.csv data to it as a table
```
CREATE SCHEMA ciaran_data;
CREATE TABLE ciaran_data.test_table AS SELECT * FROM read_csv_auto('/Users/ciaranobrien/Desktop/Work/Quack/data.csv')
```

- Check schema info
```
SELECT * FROM INFORMATION_SCHEMA.tables
```

---

## Getting started: Some simple analytics 🤖
- 1. Counting
```
SELECT COUNT(*) FROM ciaran_data.test_table
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

---

### References 📚


- Thank you to [Daniel Palma](https://medium.com/@danthelion/analyzing-bigger-files-locally-in-seconds-with-duckdb-and-datagrip-8753486a3da9) for the information on getting DuckDB connected to a JetBrains IDE, and the shell script for generating some initial dummy data.
