USE employee_management;

SHOW TABLES;

-- Q1.Display each employee's name, salary, and the average salary of all employees using AVG() with OVER().
SELECT employee_name , salary ,department_id,
AVG(salary) OVER() AS avg_sal
FROM employees;

-- Q2.Display each employee's name, department ID, salary, and department-wise average salary using PARTITION BY.
SELECT employee_name , salary ,department_id,
AVG(salary) OVER(PARTITION BY department_id) AS avg_sal
FROM employees;

-- Q3.Display each employee's name, salary, and cumulative salary ordered by employee_id using SUM() with a window ORDER BY.
SELECT employee_name , salary ,department_id,
SUM(salary) OVER(ORDER BY employee_id) AS cum_sal
FROM employees;

SELECT employee_name,salary,
SUM(salary) OVER(ORDER BY employee_id
	ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS cum_sal
FROM employees;

-- Q4.Assign a unique row number to every employee based on salary from highest to lowest.
SELECT employee_name , salary ,department_id,
ROW_NUMBER() OVER(ORDER BY salary DESC,employee_id) AS row_id
FROM employees;

-- Q5.Rank all employees based on salary from highest to lowest using RANK().
SELECT employee_name , salary ,department_id,
RANK() OVER(ORDER BY salary DESC) AS rank_high_to_low
FROM employees;

-- Q6.Rank all employees based on salary from highest to lowest using DENSE_RANK().
SELECT employee_name , salary ,department_id,
DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_high_to_low
FROM employees;

-- Q7.Rank employees separately within each department based on salary using DENSE_RANK().
SELECT employee_name , salary ,department_id,
DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS dense_rank_high_to_low
FROM employees;

-- Q8.Display each employee's name, salary, and previous employee's salary based on employee ID.
SELECT employee_name , salary ,
LAG(salary) OVER(ORDER BY employee_id) AS prev_sal
FROM employees;

-- Q9.Display each employee's name, salary, and next employee's salary based on employee ID.
SELECT employee_name , salary ,
LEAD(salary) OVER(ORDER BY employee_id) AS next_sal
FROM employees;

-- Q10.Display each employee's name, current salary, previous salary, and next salary, ordered by employee ID.
SELECT employee_name , salary ,
LAG(salary) OVER(ORDER BY employee_id) AS prev_sal,
LEAD(salary) OVER(ORDER BY employee_id) AS next_sal
FROM employees;




SELECT * FROM employees;