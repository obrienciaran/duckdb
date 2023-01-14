WITH ranking AS
         (SELECT *, RANK() OVER (PARTITION BY employee, department ORDER BY salary Desc) AS rnk
          FROM ciaran_data.test_table)
SELECT employee, department, salary
FROM ranking
WHERE rnk = 1
