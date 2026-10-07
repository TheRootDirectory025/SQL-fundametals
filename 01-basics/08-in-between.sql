-- ============================================
-- SQL Basics - IN and BETWEEN
-- File: 08-in-between.sql
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
    ('Amir', 'Jafari', 'DevOps', 34, 6000, 'Tehran'),
    ('Zahra', 'Moradi', 'Frontend', 26, 4500, 'Mashhad');


-- ============================================
-- 3. IN
-- Match one of several possible values
-- ============================================

SELECT *
FROM employees
WHERE department IN ('Backend', 'Mobile');


-- ============================================
-- 4. IN with cities
-- ============================================

SELECT *
FROM employees
WHERE city IN ('Tehran', 'Isfahan');


-- ============================================
-- 5. IN instead of multiple OR conditions
-- ============================================

-- Long version:

SELECT *
FROM employees
WHERE department = 'Backend'
   OR department = 'Frontend'
   OR department = 'Mobile';


-- Cleaner version:

SELECT *
FROM employees
WHERE department IN ('Backend', 'Frontend', 'Mobile');


-- ============================================
-- 6. NOT IN
-- Exclude several values
-- ============================================

SELECT *
FROM employees
WHERE department NOT IN ('Backend', 'DevOps');


-- ============================================
-- 7. NOT IN with cities
-- ============================================

SELECT *
FROM employees
WHERE city NOT IN ('Tehran', 'Shiraz');


-- ============================================
-- 8. BETWEEN
-- Range of values
-- ============================================

SELECT *
FROM employees
WHERE salary BETWEEN 4000 AND 5000;


-- ============================================
-- 9. BETWEEN with age
-- ============================================

SELECT *
FROM employees
WHERE age BETWEEN 25 AND 30;


-- ============================================
-- 10. NOT BETWEEN
-- Values outside a range
-- ============================================

SELECT *
FROM employees
WHERE salary NOT BETWEEN 4000 AND 5000;


-- ============================================
-- 11. BETWEEN is inclusive
-- ============================================

SELECT *
FROM employees
WHERE salary BETWEEN 4200 AND 4800;


-- ============================================
-- 12. Combining IN and BETWEEN
-- ============================================

SELECT
    first_name,
    last_name,
    department,
    salary
FROM employees
WHERE department IN ('Backend', 'Frontend')
  AND salary BETWEEN 4000 AND 5500
ORDER BY salary DESC;


-- ============================================
-- 13. Combining NOT IN and BETWEEN
-- ============================================

SELECT
    first_name,
    last_name,
    department,
    city,
    salary
FROM employees
WHERE department NOT IN ('DevOps')
  AND salary BETWEEN 3500 AND 5000;


-- ============================================
-- 14. Real-world example
-- Find employees from selected cities
-- with salaries in a specific range
-- ============================================

SELECT
    first_name,
    last_name,
    department,
    city,
    salary
FROM employees
WHERE city IN ('Tehran', 'Isfahan')
  AND salary BETWEEN 4000 AND 5500
ORDER BY salary DESC;


-- ============================================
-- 15. Another real-world example
-- Backend or Mobile employees
-- between 20 and 30 years old
-- ============================================

SELECT
    first_name,
    last_name,
    department,
    age,
    salary
FROM employees
WHERE department IN ('Backend', 'Mobile')
  AND age BETWEEN 20 AND 30
ORDER BY age;