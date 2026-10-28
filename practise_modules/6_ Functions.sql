USE employees_db_sets;

SELECT * FROM employees;

-----------------------------------------------------------------------------------
-- Level 1: Easy
-----------------------------------------------------------------------------------
-- 1. Show each name in uppercase together with its length.
SELECT UPPER(name) AS upper_name , LENGTH(name) AS lenght_name FROM employees;

-- 2. Show the first 3 letters of each name.
SELECT SUBSTRING(name,1,3) AS short_name FROM employees;
SELECT LEFT(name,3) AS short_name FROM employees;

-- 3. Show city, replacing NULL with 'Unknown'.
SELECT COALESCE(city,"UNKNOWN") FROM employees;

-- 4. Show each employee's joining year.
SELECT EXTRACT(YEAR FROM join_date) AS joining_year FROM employees;

-- 5. Show name and department as 'Ravi (Sales)'.
SELECT CONCAT(name,' (',department,')') AS concat FROM employees;

---------------------------------------------------------------------------------------
-- Level 2: Medium
---------------------------------------------------------------------------------------
-- 6. Label salary as High (70000+), Medium (50000 to 69999), Low (below 50000).
SELECT name,salary,
				CASE WHEN salary >= 70000 THEN 'High'
					WHEN salary >= 50000 THEN 'Medium'
                    ELSE 'Low' END AS label_salary
FROM employees;

-- 7. Give everyone a 10 percent hike, rounded to a whole number.
SELECT ROUND(salary + salary / 10,0) AS new_salary FROM employees;

-- 8. Employees who joined in 2021 (index-friendly).
SELECT name , join_date FROM employees
WHERE  join_date >= '2021-01-01' AND join_date < '2022-01-01';

-- 9. Employees who joined in the first half of any year (January to June).
SELECT name FROM employees
WHERE EXTRACT(MONTH FROM join_date) <= 6;


-- 10. How many times does the letter 'a' appear in each name (any case)?
SELECT name,
  LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'a', '')) AS a_count
FROM employees;

------------------------------------------------------------------------------------------------
-- Level 3: Interview style
---------------------------------------------------------------------------------------------------
-- 11. Number of employees per salary band.
SELECT band, COUNT(*) AS emp_count FROM (
  SELECT CASE WHEN salary >= 70000 THEN 'High'
              WHEN salary >= 50000 THEN 'Medium'
              ELSE 'Low' END AS band
  FROM employees) t
GROUP BY band;


-- 12. Employees per city, showing NULL as 'Unknown'.
SELECT COALESCE(city, 'Unknown') AS city, COUNT(*) AS emp_count
FROM employees
GROUP BY COALESCE(city, 'Unknown');


-- 13. Employees per joining year.
SELECT EXTRACT(YEAR FROM join_date) AS yr, COUNT(*) AS joined
FROM employees
GROUP BY EXTRACT(YEAR FROM join_date)
ORDER BY yr;


-- 14. Percentage of employees earning above 50000, as a decimal with 2 places.
SELECT ROUND(100.0 * SUM(CASE WHEN salary > 50000 THEN 1 ELSE 0 END)
       / COUNT(*), 2) AS pct
FROM employees;


-- 15. Clean the raw name ' ravi KUMAR ' into 'Ravi Kumar'.
SELECT INITCAP(TRIM('  ravi KUMAR '));


-- 16. Extract user name and domain from 'ravi.kumar@gmail.com'.
SELECT LEFT(e, POSITION('@' IN e) - 1)       AS user_name,
       SUBSTRING(e, POSITION('@' IN e) + 1)  AS domain 
FROM (SELECT 'ravi.kumar@gmail.com' AS e) t;


