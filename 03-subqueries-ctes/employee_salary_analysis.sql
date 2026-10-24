USE employee_management;

SELECT * FROM employees;
SELECT * FROM departments;

-- 1. FIND EMPLOYEE EARING MORE THAN THE AVERAGE SALARY
SELECT employee_name ,salary
FROM employees
WHERE salary > (
	SELECT AVG(salary)
    FROM employees
);
                
-- 2. FIND THE EMPLOYEE OR EMPLOYEES WITH HIGHEST SALARY
SELECT employee_name ,salary
FROM employees 
WHERE salary =(
	SELECT MAX(salary)
    FROM employees
);

-- 3. FIND EMPLOYEEES WORKING IN DEPARTMENT LOCATED IN PUNE
SELECT e.employee_name 
FROM employees e
WHERE e.department_id IN(
	SELECT d.department_id
    FROM departments d
    WHERE d.location ='Pune'
);

-- 4. FIND EMPLOYEES EARNING MORE THAN THE AVERAGE SALARY OF THEIR OWN DEPARTMENT
SELECT e.employee_name ,e.salary,e.department_id
FROM employees e
WHERE e.salary >(
	SELECT AVG(e2.salary) FROM employees e2
    WHERE e.department_id =e2.department_id
);

-- 5. FIND DEPARTMENTS THAT HAVE AT LEAST ONE EMPLOYEE
SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);

-- 6. FIND DEPARTMENTS THAT HAVE AT NO EMPLOYEE
SELECT d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);

-- 7.CREATE A CTE CONTAINING THE AVG SALARY,THEN FIND EMPLOYEES ABOVE THAT AVG
WITH avg_salary AS(
	SELECT AVG(salary) AS avg_sal
    FROM employees
)
SELECT e.employee_name,e.salary
FROM employees e
CROSS JOIN avg_salary s
WHERE e.salary > s.avg_sal;

-- 8. CREATE ONE CTE FOR EMPLOYEE COUNTS AND ANOTHER FOR AVGERAGE SALARIES PER DEPARTMENT 
WITH dept_counts AS (
    SELECT department_id, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department_id
),
dept_salaries AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT 
    d.department_name,
    dc.employee_count,
    ds.avg_salary
FROM departments d
LEFT JOIN dept_counts dc ON d.department_id = dc.department_id
LEFT JOIN dept_salaries ds ON d.department_id = ds.department_id;

-- 9. FIND DEPARTEMNTS WHOSE AVEARGE SALARY IS ABOVE THE OVERALL COMPANY AVERAGE
WITH dept_avg_salary AS (
    SELECT 
        d.department_name,
        AVG(e.salary) AS dept_avg
    FROM departments d
    JOIN employees e ON d.department_id = e.department_id
    GROUP BY d.department_name
),
company_avg_salary AS (
    SELECT AVG(salary) AS company_avg 
    FROM employees
)
SELECT 
    das.department_name,
    das.dept_avg
FROM dept_avg_salary das
CROSS JOIN company_avg_salary cas
WHERE das.dept_avg > cas.company_avg;

-- 10. USE A CTE TO IST EMPLOYEES EARNING MORE THAN 60000 ORDERED BY SALARY FROM HIGHEST TO LOWEST
WITH high_earners AS (
    SELECT employee_name, salary
    FROM employees
    WHERE salary > 60000
)
SELECT employee_name, salary
FROM high_earners
ORDER BY salary DESC;