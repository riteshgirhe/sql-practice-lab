USE customers_db;

SELECT * FROM customers_2023;
SELECT * FROM customers_2024;

-- Level 1: Easy
-------------------------------------------------------------------------------------------
-- 1. List all distinct customers (whole row) across both years.
SELECT cust_id ,name , city
FROM customers_2023
UNION
SELECT cust_id ,name,city 
FROM customers_2024;


-- 2. List all rows from both tables, keeping repeats.
SELECT cust_id ,name ,city FROM customers_2023
UNION ALL 
SELECT cust_id,name ,city FROM customers_2024
ORDER BY cust_id ;

-- 3. Customers present in both years.
SELECT cust_id ,name ,city FROM customers_2023
INTERSECT
SELECT cust_id ,name ,city FROM customers_2024;

-- 4. Customers who were in 2023 but not in 2024 (churned).
SELECT cust_id ,name,city FROM customers_2023
EXCEPT
SELECT cust_id ,name ,city FROM customers_2024;

-- 5. New customers in 2024 who were not in 2023.
SELECT cust_id ,name,city FROM customers_2024
EXCEPT
SELECT cust_id ,name ,city FROM customers_2023;


--------------------------------------------------------------------------------------------------------------
-- Level 2: Medium
--------------------------------------------------------------------------------------------------------------
-- 6. How many distinct customer IDs exist across both years?
SELECT COUNT(*) FROM (
SELECT cust_id FROM customers_2023
UNION 
SELECT cust_id FROM customers_2024)t;

-- 7. Combine both years with a column showing the year, sorted by cust_id then year.
SELECT 2023 AS yr, cust_id ,name FROM customers_2023
UNION ALL
SELECT 2024 AS yr ,cust_id ,name FROM customers_2024
ORDER BY cust_id ASC;

-- 8. All distinct names across both years in alphabetical order.
SELECT name FROM customers_2023
UNION ALL
SELECT name FROM customers_2024
ORDER BY name ASC;

-- 9. Customers in both years WITHOUT using INTERSECT.
SELECT a.cust_id ,a.name FROM customers_2023 a
WHERE EXISTS (SELECT cust_id,name FROM customers_2024 b
				WHERE a.cust_id = b.cust_id);
                
---------------------------------------------------------------------------------------------------
-- Level 3: Interview style
----------------------------------------------------------------------------------------------------
-- 11. One result showing counts of retained, churned and new customers.
SELECT 'Retained' AS status, COUNT(*) AS n FROM
 (SELECT cust_id FROM customers_2023 INTERSECT SELECT cust_id FROM customers_2024) r
UNION ALL
SELECT 'Churned', COUNT(*) FROM
 (SELECT cust_id FROM customers_2023 EXCEPT SELECT cust_id FROM customers_2024) c
UNION ALL
SELECT 'New', COUNT(*) FROM
 (SELECT cust_id FROM customers_2024 EXCEPT SELECT cust_id FROM customers_2023) n;
 

-- 12. Show every row that differs between the two tables (symmetric difference).
(SELECT * FROM customers_2023 EXCEPT SELECT * FROM customers_2024)
UNION ALL
(SELECT * FROM customers_2024 EXCEPT SELECT * FROM customers_2023);


-- 13. Merge customers_2024 with a vendors(vendor_id, vendor_name) table into one list with a type column.
SELECT cust_id AS id, name, 'Customer' AS type FROM customers_2024
UNION ALL
SELECT vendor_id, vendor_name, 'Vendor' FROM vendors;


-- 14. Customers in both years using a JOIN on all three columns. How many rows and why?
SELECT a.cust_id
FROM customers_2023 a JOIN customers_2024 b
  ON a.cust_id = b.cust_id AND a.name = b.name AND a.city = b.city;-- 2 rows (3 and 4). Arjun is lost because NULL = NULL is not true.-- INTERSECT returns 3 rows.
  
  
-- 15. Churned customers (2023 not in 2024) using LEFT JOIN instead of EXCEPT.
SELECT a.cust_id, a.name
FROM customers_2023 a
LEFT JOIN customers_2024 b ON a.cust_id = b.cust_id
WHERE b.cust_id IS NULL;

SELECT cust_id FROM customers_2023
UNION
SELECT name FROM customers_2024;-- Incompatible types (integer vs text). PostgreSQL errors; MySQL may silently convert and give wrong results.