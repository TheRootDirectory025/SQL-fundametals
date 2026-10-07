-- ============================================
-- SQL Basics - Functions
-- File: 10-functions.sql
-- ============================================


-- ============================================
-- 1. Create sample table
-- ============================================

CREATE TEMP TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10, 2)
);


-- ============================================
-- 2. Insert sample data
-- ============================================

INSERT INTO employees
(first_name, last_name, email, department, salary)
VALUES
    ('Ali', 'Ahmadi', 'ali.ahmadi@gmail.com', 'Backend', 3500.50),
    ('Sara', 'Mohammadi', 'sara.mohammadi@gmail.com', 'Frontend', 4200.75),
    ('Reza', 'Karimi', 'reza.karimi@gmail.com', 'Backend', 5200.40),
    ('Nima', 'Hosseini', 'nima.hosseini@yahoo.com', 'Mobile', 3800.25),
    ('Mina', 'Rahimi', 'mina.rahimi@gmail.com', 'Backend', 4800.90);


-- ============================================
-- 3. UPPER
-- Convert text to uppercase
-- ============================================

SELECT
    first_name,
    UPPER(first_name) AS uppercase_name
FROM employees;


-- ============================================
-- 4. LOWER
-- Convert text to lowercase
-- ============================================

SELECT
    last_name,
    LOWER(last_name) AS lowercase_name
FROM employees;


-- ============================================
-- 5. LENGTH
-- Count characters
-- ============================================

SELECT
    first_name,
    LENGTH(first_name) AS name_length
FROM employees;


-- ============================================
-- 6. LENGTH for email
-- ============================================

SELECT
    email,
    LENGTH(email) AS email_length
FROM employees;


-- ============================================
-- 7. CONCAT
-- Combine multiple values
-- ============================================

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;


-- ============================================
-- 8. CONCAT with additional text
-- ============================================

SELECT
    CONCAT(
            first_name,
            ' ',
            last_name,
            ' - ',
            department
    ) AS employee_info
FROM employees;


-- ============================================
-- 9. CONCAT_WS
-- CONCAT with separator
-- ============================================

SELECT
    CONCAT_WS(' ', first_name, last_name) AS full_name
FROM employees;


-- ============================================
-- 10. ROUND
-- Round numeric values
-- ============================================

SELECT
    salary,
    ROUND(salary) AS rounded_salary
FROM employees;


-- ============================================
-- 11. ROUND with decimal places
-- ============================================

SELECT
    salary,
    ROUND(salary, 1) AS rounded_salary
FROM employees;


-- ============================================
-- 12. ABS
-- Absolute value
-- ============================================

SELECT
    ABS(-100) AS positive_value;


-- ============================================
-- 13. Mathematical calculation
-- ============================================

SELECT
    first_name,
    salary,
    salary * 12 AS yearly_salary
FROM employees;


-- ============================================
-- 14. ROUND with calculation
-- ============================================

SELECT
    first_name,
    salary,
    ROUND(salary * 12, 2) AS yearly_salary
FROM employees;


-- ============================================
-- 15. LOWER + LIKE
-- ============================================

SELECT
    first_name,
    last_name,
    email
FROM employees
WHERE LOWER(email) LIKE '%gmail.com';


-- ============================================
-- 16. UPPER in output
-- ============================================

SELECT
    UPPER(first_name) AS first_name,
    UPPER(last_name) AS last_name,
    department
FROM employees;


-- ============================================
-- 17. Full name + salary
-- ============================================

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name,
    ROUND(salary, 2) AS salary
FROM employees
ORDER BY salary DESC;


-- ============================================
-- 18. Real-world example
-- Employee report
-- ============================================

SELECT
    id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    UPPER(department) AS department,
    LENGTH(first_name) AS name_length,
    ROUND(salary, 2) AS monthly_salary,
    ROUND(salary * 12, 2) AS yearly_salary
FROM employees
ORDER BY yearly_salary DESC;