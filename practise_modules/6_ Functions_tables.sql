CREATE DATABASE IF NOT EXISTS employees_db_sets;

USE employees_db_sets;

CREATE TABLE employees(
employee_id INT PRIMARY KEY ,
name  VARCHAR(50),
department VARCHAR(50),
salary INT,
city VARCHAR(100) ,
join_date DATE 
);


INSERT INTO employees
    (employee_id, name, department, salary, city, join_date)
VALUES
    (1, 'Ravi',  'Sales', 50000, 'Delhi',  '2021-03-15'),
    (2, 'Anita', 'HR',    45000, 'Mumbai', '2020-07-01'),
    (3, 'Kiran', 'Sales', 60000, 'Delhi',  '2019-11-20'),
    (4, 'Sneha', 'IT',    80000, 'Pune',   '2022-01-10'),
    (5, 'Arjun', 'IT',    75000, NULL,     '2021-09-05'),
    (6, 'Meena', 'HR',    45000, 'Mumbai', '2023-02-28');

SELECT * FROM employees;