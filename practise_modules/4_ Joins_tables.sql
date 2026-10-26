
-- =====================================================
-- DATABASE: company_db
-- PURPOSE: SQL JOIN practice
-- TABLES: departments, employees, projects
-- =====================================================

-- 1. CREATE DATABASE
CREATE DATABASE IF NOT EXISTS company_db;

-- Select the database
USE company_db;


-- =====================================================
-- 2. CREATE DEPARTMENTS TABLE
-- Parent table for employees and projects
-- =====================================================

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);


-- Insert department records
INSERT INTO departments (dept_id, dept_name, location)
VALUES
(10, 'Sales', 'Delhi'),
(20, 'HR', 'Mumbai'),
(30, 'IT', 'Pune'),
(40, 'Finance', 'Chennai');


-- =====================================================
-- 3. CREATE EMPLOYEES TABLE
-- Each employee may belong to a department.
-- manager_id refers to another employee's emp_id.
-- =====================================================

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id INT NULL,
    salary DECIMAL(10, 2),
    manager_id INT NULL,

    -- Link employees to their departments
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id),

    -- Self-referencing foreign key for managers
    FOREIGN KEY (manager_id)
        REFERENCES employees(emp_id)
);


-- Insert employee records
INSERT INTO employees
(emp_id, name, dept_id, salary, manager_id)
VALUES
(1, 'Ravi', 10, 50000, NULL),
(2, 'Anita', 20, 45000, NULL),
(3, 'Kiran', 10, 60000, NULL),
(4, 'Sneha', 30, 80000, NULL),
(5, 'Arjun', 30, 75000, NULL),
(6, 'Meena', 20, 45000, NULL),
(7, 'Vikram', NULL, 65000, NULL);


UPDATE employees
SET manager_id = 3
WHERE emp_id IN (1, 7);

UPDATE employees
SET manager_id = 6
WHERE emp_id = 2;

UPDATE employees
SET manager_id = 4
WHERE emp_id = 5;

-- =====================================================
-- 4. CREATE PROJECTS TABLE
-- Each project may be assigned to a department.
-- =====================================================

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    dept_id INT,

    -- Link projects to their departments
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);


-- Insert project records
INSERT INTO projects (project_id, project_name, dept_id)
VALUES
(101, 'Website', 30),
(102, 'Campaign', 10),
(103, 'Hiring', 20),
(104, 'Mobile App', 30);


-- =====================================================
-- 5. VERIFY ALL TABLES
-- =====================================================

-- Display all departments
SELECT * FROM departments;

-- Display all employees
SELECT * FROM employees;

-- Display all projects
SELECT * FROM projects;


-- =====================================================
-- 6. OPTIONAL: TEST A BASIC INNER JOIN
-- Show employees with their department names.
-- Employees without a department are excluded.
-- =====================================================

SELECT
    e.emp_id,
    e.name AS employee_name,
    d.dept_name,
    e.salary
FROM employees AS e
INNER JOIN departments AS d
    ON e.dept_id = d.dept_id;


-- =====================================================
-- 7. OPTIONAL: JOIN DEPARTMENTS WITH PROJECTS
-- Show each project and its department name.
-- =====================================================

SELECT
    p.project_id,
    p.project_name,
    d.dept_name,
    d.location
FROM projects AS p
INNER JOIN departments AS d
    ON p.dept_id = d.dept_id;

