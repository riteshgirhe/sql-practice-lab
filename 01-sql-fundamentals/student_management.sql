CREATE DATABASE student_management;

USE student_management;

CREATE TABLE students(
student_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age INT NOT NULL,
department VARCHAR(100),
city VARCHAR(50),
marks DECIMAL(5,2) NOT NULL
);


INSERT INTO students
(student_id, name, age, department, city, marks)
VALUES
(1, 'Amit', 21, 'Computer Science', 'Pune', 85.50),
(2, 'Priya', 22, 'Data Science', 'Mumbai', 92.00),
(3, 'Rahul', 20, 'Mathematics', 'Pune', 67.50),
(4, 'Sneha', 21, 'Data Science', 'Nashik', 88.00),
(5, 'Vikas', 23, 'Computer Science', 'Mumbai', 55.00),
(6, 'Neha', 22, 'Mathematics', 'Pune', 76.50),
(7, 'Rohan', 20, 'Computer Science', 'Nagpur', 91.00),
(8, 'Pooja', 21, 'Data Science', 'Pune', 63.00),
(9, 'Karan', 23, 'Mathematics', 'Nashik', 82.00),
(10, 'Anjali', 22, 'Computer Science', 'Mumbai', 73.50);


-- 1.DIAPLAY ALL STUDENT RECORDS
SELECT * FROM students;

-- 2.FIND STUDENTS WHO SCORED MORE THAN 80 MARKS
SELECT * FROM students 
WHERE marks > 80;

-- 3.DISPLAY STUDENTS FROM HIGHEST TO LOWEST MARKS
SELECT * FROM students 
ORDER BY marks DESC ;

-- 4. DISPLAY ALL UNIQUE DEPARTMENT NAMES 
SELECT DISTINCT department FROM students;

-- 5.FIND STUDENT FROM PUNE WHO SCORED ABOVE 70
SELECT * FROM students
WHERE city = "Pune" AND marks > 70 ;

-- 6. FIND STUDENTS WHO MARKS ARE BETWEEN 70 AND 90
SELECT * FROM students
WHERE marks BETWEEN 70 AND 90;

-- 7. FIND STIDETNS WHOSE NAMES START WITH 'A'
SELECT * FROM students
WHERE name like "A%";

-- 8.DISPLAY TOP 3 STUDENTS BY MARKS
SELECT * FROM students
ORDER BY marks DESC
LIMIT 3;

-- 9. INCREASE AMIT MARKS TO 89.00
UPDATE students
SET marks=89
WHERE student_id =1;

-- 10.DELETE THE RECORD OF STUDENT ID 5
DELETE FROM students 
WHERE student_id =5;

-- 11.COUNT THE TOTAL NUMBER OF STUDENTS
SELECT COUNT(*) FROM students;

-- 12.FIND AVGERAGE , HIGHEST AND LOWEST MARKS
SELECT AVG(marks) AS avg_marks,
MAX(marks) AS max_marks,
MIN(marks) AS min_marks
FROM students;

-- 13.COUNT HOW MANY STUDENTS BELONG MARKS GREATER THAN 80
SELECT department,COUNT(*) AS total_department
FROM students
WHERE marks > 80
GROUP BY department;

-- 14.SHOW DEPARTMENT WITH AN AVG MARK GREATER THAN 80
SELECT department ,AVG(marks) AS avg_marks FROM students
GROUP BY department 
HAVING AVG(marks) > 80;

-- 15. CLASSIFY STUDETNS AS PASS(MARKS>=40)OR FAIL
SELECT name,marks,
CASE 
WHEN marks >= 39 THEN 'PASS'
ELSE 'FAIL'
END AS GRADE
FROM students;
