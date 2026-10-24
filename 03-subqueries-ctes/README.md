# Employee Salary Analysis — Subqueries & CTEs

A hands-on SQL project built with **MySQL** to analyze employee salaries, compare departmental performance, and practice subqueries, correlated subqueries, `EXISTS`, `NOT EXISTS`, and Common Table Expressions (CTEs).

## Project Overview

The project uses the `employee_management` database, which contains two related tables: `employees` and `departments`.

It includes **10 SQL queries** covering salary comparisons, department filtering, employee existence checks, average salary analysis, and reusable CTEs for department-level reporting.

## Technologies Used

- MySQL
- MySQL Workbench
- SQL

## Database Schema

**Database:** `employee_management`

### Table 1: `employees`

| Column | Description |
|---|---|
| `employee_id` | Unique employee ID |
| `employee_name` | Employee name |
| `salary` | Employee salary |
| `department_id` | Employee's department ID |
| `manager_id` | Manager's employee ID |

### Table 2: `departments`

| Column | Description |
|---|---|
| `department_id` | Unique department ID |
| `department_name` | Department name |
| `location` | Department location |

The SQL script uses the existing employee and department tables created in the Employee Management System project.

## Queries Included

| # | Task | Concepts |
|---|---|---|
| 1 | Find employees earning more than the overall average salary | Scalar subquery, `AVG()` |
| 2 | Find the employee or employees with the highest salary | Subquery, `MAX()` |
| 3 | Find employees working in departments located in Pune | Subquery, `IN` |
| 4 | Find employees earning more than their department's average salary | Correlated subquery, `AVG()` |
| 5 | Find departments that have at least one employee | `EXISTS` |
| 6 | Find departments that have no employees | `NOT EXISTS` |
| 7 | Find employees earning above the overall average using a CTE | `WITH`, `CROSS JOIN` |
| 8 | Calculate employee counts and average salaries for each department | Multiple CTEs, `COUNT()`, `AVG()`, `LEFT JOIN` |
| 9 | Find departments whose average salary exceeds the company-wide average | Multiple CTEs, `CROSS JOIN`, comparison |
| 10 | List employees earning more than 60,000, ordered by salary | CTE, `WHERE`, `ORDER BY DESC` |

## SQL Concepts Practiced

- Scalar subqueries
- Correlated subqueries
- Subqueries with `IN`
- `EXISTS` and `NOT EXISTS`
- Common Table Expressions (CTEs)
- Multiple CTEs in a single query
- `CROSS JOIN` for comparing aggregate results
- Aggregate functions: `AVG()`, `MAX()`, `COUNT()`
- Department-level salary analysis
- Filtering and sorting query results

## Sample Queries

### 1. Employees Earning Above the Average Salary

```sql
SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```

### 2. Employees Earning More Than Their Department Average

```sql
SELECT e.employee_name, e.salary, e.department_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e.department_id = e2.department_id
);
```

### 3. Using a CTE to Find High-Earning Employees

```sql
WITH high_earners AS (
    SELECT employee_name, salary
    FROM employees
    WHERE salary > 60000
)
SELECT employee_name, salary
FROM high_earners
ORDER BY salary DESC;
```

## How to Run

1. Install MySQL Server and MySQL Workbench.
2. Set up the `employee_management` database using the SQL script from your Employee Management System project.
3. Open `03-subqueries-ctes-employee_salary_analysis.sql` in MySQL Workbench.
4. Execute the script against the existing database.
5. Run the queries individually and examine the results.

**Note:** This script uses `USE employee_management;` and assumes the `employees` and `departments` tables already exist with sample data.

## Project Structure

```text
.
├── employee_salary_analysis.sql
└── README.md
```

## Learning Objectives

- Compare individual salaries against company-wide and department-level averages.
- Identify maximum-salary employees and handle ties.
- Filter records using subqueries.
- Check for matching and missing related records with `EXISTS` and `NOT EXISTS`.
- Simplify complex queries using CTEs.
- Combine department-level and company-level statistics for salary analysis.

## Author

**Ritesh Girhe**

Computer Science graduate from Fergusson College, Pune, interested in Data Analytics, Data Science, and Machine Learning.

- GitHub: [@riteshgirhe](https://github.com/riteshgirhe)
- LinkedIn: [Ritesh Girhe](https://www.linkedin.com/in/riteshgirhe/)

---

**Project:** Employee Salary Analysis — Subqueries & CTEs  
**Database:** MySQL  
**Focus:** Advanced SQL querying and analytical reporting
