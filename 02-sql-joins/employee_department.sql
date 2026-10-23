CREATE DATABASE employee_management;

USE employee_management;

CREATE TABLE departments(
department_id INT PRIMARY KEY,
department_name VARCHAR(100) NOT NULL,
location VARCHAR(100)
);

CREATE TABLE employees(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100) NOT NULL,
salary DECIMAL(10,2),
department_id INT,
manager_id INT,
FOREIGN KEY(department_id)
    REFERENCES departments(department_id)
);

SHOW TABLES;


INSERT INTO departments
(department_id, department_name, location)
VALUES
(10, 'IT', 'Pune'),
(20, 'HR', 'Mumbai'),
(30, 'Finance', 'Bengaluru'),
(40, 'Marketing', 'Hyderabad'),
(50, 'Research', 'Pune');

INSERT INTO employees
(employee_id, employee_name, salary, department_id, manager_id)
VALUES
(1, 'Amit', 60000, 10, NULL),
(2, 'Priya', 75000, 10, 1),
(3, 'Rahul', 50000, 20, NULL),
(4, 'Sneha', 80000, 30, NULL),
(5, 'Vikas', 45000, 20, 3),
(6, 'Neha', 70000, 40, NULL),
(7, 'Rohan', 90000, 10, 1),
(8, 'Pooja', 55000, NULL, NULL);

-- 1.DISPLAY EACH EMPLOYEES NAME ALONGSIDE THERE DEPARTMENT NAME
SELECT departments.department_name ,employees.employee_name 
FROM departments
INNER JOIN employees
ON departments.department_id = employees.department_id;

-- 2. DISPLAY ALL EMPLOYEES, INCLUDING EMPLOYEES WITHOUT A DEPARTMENT
SELECT e.* , d.department_id
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;


-- 3. DISPLAY ALL DEPARTMENTS.INCLUDING DEPARTMENTS WITHOUT EMPLOYEES
SELECT d.department_name , e.employee_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id;

-- 4. FIND EMPLOYEES WHO IN THE IT DEPARTMENT
SELECT d.department_name , e.employee_name
FROM departments d
RIGHT JOIN employees e
ON d.department_id = e.department_id
WHERE d.department_name ="IT";

-- 5. DISPLAY EMPLOYEE NAMES , DEPARTMENT NAMES AND SALARIES ,SORTED FROM HIGHEST SALARY TO LOWEST
SELECT e.employee_name ,e.salary , d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.salary DESC;

-- 6. COUNT THE NUMBER OF EMPLOYEE IN EACH DEPARTMENT,INCLUDING DEPARTMENTS WITH ZERO EMPLOYEES
SELECT d.department_name,COUNT(e.employee_id) AS nos_employees
FROM departments d
LEFT JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 7. CALCULATE THE AVERAGE SALARY FOR EACH DEPARTMENT
SELECT d.department_name , COUNT(e.employee_id) AS nos_employees,AVG(e.salary) AS avg_salary
FROM departments d
INNER JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 8. DISPLAY EACH EMPLOYEES NAME ALONGSIDE THERE MANAGERS NAME
SELECT 
    e1.employee_name AS Employee, 
    e2.employee_name AS Manager
FROM employees e1,employees e2
WHERE e1.manager_id = e2.employee_id;

-- 9. FIND EMPLOYEES EARNING MORE THAN 60000 WHO BELONG TO THE IT DEPARTMENT
SELECT e.employee_name, e.salary, d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT'
  AND e.salary > 60000;

DESCRIBE departments;
DESCRIBE employees;

-- 10. FIND EMPLOYEES WHO ARE NOT ASSIGNED TO ANY DEPARTMENT
SELECT  e.employee_name
FROM departments d
RIGHT JOIN employees e
ON d.department_id = e.department_id
WHERE d.department_name IS NULL;

SELECT employee_name
FROM employees
WHERE department_id IS NULL;