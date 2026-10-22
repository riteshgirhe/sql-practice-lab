# Student Management System — SQL Fundamentals

A beginner-level SQL project built with **MySQL** to manage student records and practice core SQL queries, from creating a table to grouping and classifying data.

## Project Overview

The project creates a `student_management` database with one `students` table. It then runs 15 queries that cover the fundamentals: filtering, sorting, updating, deleting, aggregating and classifying records.

## Technologies Used

- MySQL
- MySQL Workbench
- SQL

## Database Schema

**Database:** `student_management`
**Table:** `students`

| Column       | Type          | Constraint  | Description         |
|--------------|---------------|-------------|---------------------|
| `student_id` | INT           | PRIMARY KEY | Unique student ID   |
| `name`       | VARCHAR(50)   | NOT NULL    | Student name        |
| `age`        | INT           | NOT NULL    | Student age         |
| `department` | VARCHAR(100)  |             | Academic department |
| `city`       | VARCHAR(50)   |             | Student's city      |
| `marks`      | DECIMAL(5,2)  | NOT NULL    | Student marks       |

The table is seeded with 10 sample students across three departments (Computer Science, Data Science, Mathematics) and four cities (Pune, Mumbai, Nashik, Nagpur).

## Queries Included

| #  | Task                                              | Concepts                    |
|----|---------------------------------------------------|-----------------------------|
| 1  | Display all student records                       | `SELECT *`                  |
| 2  | Students who scored more than 80                  | `WHERE`, comparison         |
| 3  | Students from highest to lowest marks             | `ORDER BY ... DESC`         |
| 4  | Unique department names                           | `DISTINCT`                  |
| 5  | Students from Pune who scored above 70            | `AND`                       |
| 6  | Students with marks between 70 and 90             | `BETWEEN`                   |
| 7  | Names starting with 'A'                           | `LIKE`                      |
| 8  | Top 3 students by marks                           | `ORDER BY`, `LIMIT`         |
| 9  | Update Amit's marks to 89                         | `UPDATE`                    |
| 10 | Delete student with ID 5                          | `DELETE`                    |
| 11 | Total number of students                          | `COUNT`                     |
| 12 | Average, highest and lowest marks                 | `AVG`, `MAX`, `MIN`         |
| 13 | Number of students scoring above 80 per department| `GROUP BY`                  |
| 14 | Departments with average marks above 80           | `GROUP BY`, `HAVING`        |
| 15 | Classify students as PASS or FAIL                 | `CASE WHEN`                 |

## SQL Concepts Practiced

- Database and table creation
- Data insertion, updating and deletion
- `SELECT` queries and filtering
- Comparison and logical operators
- `DISTINCT`, `LIKE`, `BETWEEN` and `LIMIT`
- Sorting with `ORDER BY`
- Aggregate functions: `COUNT`, `AVG`, `MAX`, `MIN`
- `GROUP BY` and `HAVING`
- `CASE WHEN` for conditional classification

## Sample Query

```sql
-- Departments with an average mark greater than 80
SELECT department, AVG(marks) AS avg_marks
FROM students
GROUP BY department
HAVING AVG(marks) > 80;
```

## How to Run

1. Install MySQL Server and MySQL Workbench.
2. Open `student_management.sql` in MySQL Workbench.
3. Execute the statements in order (the file creates the database, table and data first).
4. Run the queries one by one to explore the student records.

> Queries 9 and 10 modify the data (`UPDATE` and `DELETE`), so queries 11 to 15 run on the changed table.

## Project Structure

```
.
├── student_management.sql   # Schema, sample data and 15 queries
└── README.md
```

## Learning Objective

To build a strong foundation in SQL through hands-on database creation, data manipulation, filtering and aggregation.

## Author

**Ritesh Girhe**

Computer Science graduate from Fergusson College, Pune, interested in Data Analytics, Data Science, and Machine Learning.

- GitHub: [@riteshgirhe](https://github.com/riteshgirhe)
- LinkedIn: [Ritesh Girhe](https://www.linkedin.com/in/riteshgirhe/)
