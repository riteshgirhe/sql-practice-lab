-- Select the database
USE company_db;

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;

-- Level 1: Easy
-- 1. Show each employee's name with their department name (only employees that have a department).
SELECT name,dept_name 
FROM departments
INNER JOIN employees 
ON departments.dept_id = employees.dept_id;

--  2. Show ALL employees with their department name, even those without a department
SELECT e.name , d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 3. Show ALL departments with their employee names, including departments with no employees.
SELECT e.name , d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

SELECT d.dept_name , e.name 
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

-- 4. Find employees who do not belong to any department.
SELECT e.name 
FROM employees e
LEFT JOIN departments d
ON d.dept_id = e.dept_id
WHERE d.dept_id IS NULL;

-- 5. Find departments that have no employees.
SELECT d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
WHERE e.name IS NULL;



-- Level 2: Medium


-- 6. Number of employees in each department, including departments with zero.
SELECT d.dept_name , COUNT(e.emp_id) AS emp_count
FROM departments d
LEFT JOIN employees e
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 7. Total salary per department name (only departments with employees)
SELECT d.dept_name , SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d
ON e.dept_id =d.dept_id
GROUP BY d.dept_name;

-- 8. Show each employee with their manager's name (include employees with no manager).
SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- 9. Employees who earn more than their manager.
SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

-- 10. Names of employees working in a department located in Delhi.
SELECT e.name 
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE location ="Delhi";


-- Level 3: Interview style


-- 11. Departments that have more than one project.
SELECT d.dept_name , COUNT(*) AS total_project
FROM projects p
LEFT JOIN departments d
ON d.dept_id = p.dept_id
GROUP BY d.dept_name
HAVING total_project > 1; 

-- 12. Departments that have no project.
SELECT d.dept_name 
FROM departments d
LEFT JOIN projects p
ON d.dept_id = p.dept_id
WHERE p.project_id IS NULL; 

-- 13. Each manager and the number of their direct reports.
SELECT m.name As manager , COUNT(*) AS REPORT
FROM employees e
JOIN employees m
ON m.emp_id =e.manager_id
GROUP BY m.name;

-- 14. Department with the highest average salary (using a join)
SELECT d.dept_name , AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY avg_salary DESC
LIMIT 1;

-- 15. List everything unmatched on either side (employees without department, departments without employees).
SELECT e.name,d.dept_name 
FROM employees e
LEFT JOIN departments d
ON e.dept_id =d.dept_id
UNION 
SELECT e.name,d.dept_name 
FROM employees e
RIGHT JOIN departments d
ON e.dept_id =d.dept_id;

-- 16. All employees, but show department name only for the Sales department (others NULL)
SELECT e.name,d.dept_name 
FROM employees e
LEFT JOIN departments d
ON e.dept_id =d.dept_id AND d.dept_name = 'Sales';

-- 17. Employees who earn more than the average salary of their own department.
SELECT e.name, e.salary
FROM employees e
JOIN (SELECT dept_id, AVG(salary) AS avg_sal
      FROM employees GROUP BY dept_id) a
  ON e.dept_id = a.dept_id
WHERE e.salary > a.avg_sal;

-- 18.CROSS JOIN Example (runs only in mysql)
SELECT e.name, d.dept_name
FROM employees e JOIN departments d;

