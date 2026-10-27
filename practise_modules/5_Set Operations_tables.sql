
CREATE DATABASE customers_db;

USE customers_db;

CREATE TABLE customers_2023 (
    cust_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE customers_2024 (
    cust_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);



INSERT INTO customers_2023 (cust_id, name, city)
VALUES
(1, 'Ravi', 'Delhi'),
(2, 'Anita', 'Mumbai'),
(3, 'Kiran', 'Delhi'),
(4, 'Sneha', 'Pune'),
(5, 'Arjun', NULL);

INSERT INTO customers_2024 (cust_id, name, city)
VALUES
(3, 'Kiran', 'Delhi'),
(4, 'Sneha', 'Pune'),
(5, 'Arjun', NULL),
(6, 'Meena', 'Mumbai'),
(7, 'Vikram', 'Delhi');


SELECT * FROM customers_2023;
SELECT * FROM customers_2024;