# Employee Management System — SQL Joins

A beginner-level SQL project built with **MySQL** to manage employee and department records and practice relational queries using different types of joins, aggregation, filtering, and self-joins.

## Project Overview

The project creates an `employee_management` database with two related tables: `employees` and `departments`. It uses sample employee and department records to demonstrate how SQL joins retrieve data across tables and handle missing relationships.

The project includes 10 practice queries covering employee–department relationships, salary analysis, employee–manager relationships, and departments with or without employees.

## Technologies Used

- MySQL
- MySQL Workbench
- SQL

## Database Schema

**Database:** `employee_management`

### Table 1: `departments`

| Column | Type | Constraint | Description |
|---|---|---|---|
| `department_id` | INT | PRIMARY KEY | Unique department ID |
| `department_name` | VARCHAR(100) | NOT NULL | Department name |
| `location` | VARCHAR(100) | | Department location |

### Table 2: `employees`

| Column | Type | Constraint | Description |
|---|---|---|---|
| `employee_id` | INT | PRIMARY KEY | Unique employee ID |
| `employee_name` | VARCHAR(100) | NOT NULL | Employee name |
| `salary` | DECIMAL(10,2) | | Employee salary |
| `department_id` | INT | FOREIGN KEY | References `departments.department_id` |
| `manager_id` | INT | | References the manager's employee ID logically |

The database is seeded with **8 employees across 4 departments**, with one additional department that has no employees assigned. The sample data also includes an employee without a department and employees with different manager assignments.

## Queries Included

| # | Task | Concepts |
|---|---|---|
| 1 | Display employee names alongside their department names | `INNER JOIN` |
| 2 | Display all employees, including employees without a department | `LEFT JOIN` |
| 3 | Display all departments, including departments without employees | `LEFT JOIN` |
| 4 | Find employees who belong to the IT department | `RIGHT JOIN`, `WHERE` |
| 5 | Display employee names, department names, and salaries from highest to lowest | `LEFT JOIN`, `ORDER BY DESC` |
| 6 | Count employees in each department, including departments with zero employees | `LEFT JOIN`, `COUNT`, `GROUP BY` |
| 7 | Calculate the average salary for each department | `INNER JOIN`, `AVG`, `GROUP BY` |
| 8 | Display each employee alongside their manager's name | `SELF JOIN` |
| 9 | Find IT employees earning more than 60,000 | `INNER JOIN`, `WHERE`, `AND` |
| 10 | Find employees who are not assigned to any department | `RIGHT JOIN`, `IS NULL` |

## SQL Concepts Practiced

- Database and table creation
- Primary keys and foreign keys
- Inserting sample records
- `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN`
- Self-joins for employee–manager relationships
- Join conditions using `ON`
- Filtering with `WHERE`, `AND`, and `IS NULL`
- Sorting with `ORDER BY DESC`
- Aggregate functions: `COUNT()` and `AVG()`
- Grouping records with `GROUP BY`
- Handling unmatched records across related tables

## Sample Queries

### 1. Display Employees with Department Names

```sql
SELECT d.department_name, e.employee_name
FROM departments d
INNER JOIN employees e
    ON d.department_id = e.department_id;
```

### 2. Count Employees in Each Department

```sql
SELECT d.department_name,
       COUNT(e.employee_id) AS total_employees
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name;
```

### 3. Display Employees and Their Managers

```sql
SELECT
    e1.employee_name AS Employee,
    e2.employee_name AS Manager
FROM employees e1
JOIN employees e2
    ON e1.manager_id = e2.employee_id;
```

## How to Run

1. Install MySQL Server and MySQL Workbench.
2. Open `02-sql-joins-employee_department.sql` in MySQL Workbench.
3. Execute the SQL statements in order. The script creates the database, tables, sample records, and practice queries.
4. Run the queries individually and inspect their outputs to understand the different join types.

**Note:** The script uses `CREATE DATABASE` and `CREATE TABLE` without `IF NOT EXISTS`. If the database and tables already exist, rerunning the full script may produce errors. Use a fresh database or execute the setup carefully.

## Project Structure

```text
.
├── employee_department.sql
└── README.md
```

## Learning Objective

To develop a strong foundation in SQL joins by working with related tables, retrieving matching and unmatched records, analyzing employee salaries, grouping department data, and understanding self-joins.

## Author

**Ritesh Girhe**

Computer Science graduate from Fergusson College, Pune, interested in Data Analytics, Data Science, and Machine Learning.

- GitHub: [@riteshgirhe](https://github.com/riteshgirhe)
- LinkedIn: [Ritesh Girhe](https://www.linkedin.com/in/riteshgirhe/)
