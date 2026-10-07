-- ============================================
-- SQL Basics - Operators
-- File: 07-operators.sql
-- ============================================


-- ============================================
-- 1. Create sample table
-- ============================================

CREATE TEMP TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    age INT,
    salary NUMERIC(10, 2),
    city VARCHAR(50)
);


-- ============================================
-- 2. Insert sample data
-- ============================================

INSERT INTO employees
(first_name, last_name, department, age, salary, city)
VALUES
    ('Ali', 'Ahmadi', 'Backend', 24, 3500, 'Tehran'),
    ('Sara', 'Mohammadi', 'Frontend', 27, 4200, 'Tehran'),
    ('Reza', 'Karimi', 'Backend', 31, 5200, 'Isfahan'),
    ('Nima', 'Hosseini', 'Mobile', 23, 3800, 'Shiraz'),
    ('Mina', 'Rahimi', 'Backend', 29, 4800, 'Tehran'),
    ('Amir', 'Jafari', 'DevOps', 34, 6000, 'Tehran');


-- ============================================
-- 3. AND
-- Both conditions must be true
-- ============================================

SELECT *
FROM employees
WHERE department = 'Backend'
  AND salary > 4000;


-- ============================================
-- 4. Multiple AND conditions
-- ============================================

SELECT *
FROM employees
WHERE department = 'Backend'
  AND salary > 4000
  AND age < 30;


-- ============================================
-- 5. OR
-- At least one condition must be true
-- ============================================

SELECT *
FROM employees
WHERE department = 'Backend'
   OR department = 'Mobile';


-- ============================================
-- 6. OR with different conditions
-- ============================================

SELECT *
FROM employees
WHERE city = 'Tehran'
   OR salary > 5000;


-- ============================================
-- 7. NOT
-- Reverse a condition
-- ============================================

SELECT *
FROM employees
WHERE NOT department = 'Backend';


-- ============================================
-- 8. NOT with another condition
-- ============================================

SELECT *
FROM employees
WHERE NOT city = 'Tehran';


-- ============================================
-- 9. Parentheses
-- Control the order of conditions
-- ============================================

SELECT *
FROM employees
WHERE department = 'Backend'
  AND (city = 'Tehran' OR city = 'Isfahan');


-- ============================================
-- 10. AND + OR
-- Without parentheses
-- ============================================

SELECT *
FROM employees
WHERE department = 'Backend'
   OR department = 'Mobile'
    AND salary > 4000;


-- ============================================
-- 11. AND + OR
-- With parentheses
-- ============================================

SELECT *
FROM employees
WHERE (department = 'Backend' OR department = 'Mobile')
  AND salary > 4000;


-- ============================================
-- 12. Comparison operators
-- ============================================

SELECT *
FROM employees
WHERE salary = 4200;

SELECT *
FROM employees
WHERE salary <> 4200;

SELECT *
FROM employees
WHERE salary > 4000;

SELECT *
FROM employees
WHERE salary >= 4000;

SELECT *
FROM employees
WHERE salary < 4000;

SELECT *
FROM employees
WHERE salary <= 4000;


-- ============================================
-- 13. Combining comparison operators
-- ============================================

SELECT *
FROM employees
WHERE age >= 25
  AND age <= 30;


-- ============================================
-- 14. Complex real-world example
-- Backend developers in Tehran
-- with salary above 4000
-- ============================================

SELECT
    first_name,
    last_name,
    department,
    salary,
    city
FROM employees
WHERE department = 'Backend'
  AND city = 'Tehran'
  AND salary > 4000
ORDER BY salary DESC;


-- ============================================
-- 15. Another real-world example
-- Employees who are either:
-- Backend developers with salary > 4500
-- OR DevOps developers
-- ============================================

SELECT
    first_name,
    last_name,
    department,
    salary
FROM employees
WHERE (department = 'Backend' AND salary > 4500)
   OR department = 'DevOps'
ORDER BY salary DESC;