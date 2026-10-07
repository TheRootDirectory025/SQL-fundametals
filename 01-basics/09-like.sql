-- ============================================
-- SQL Basics - LIKE and ILIKE
-- File: 09-like.sql
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
    city VARCHAR(50),
    salary NUMERIC(10, 2)
);


-- ============================================
-- 2. Insert sample data
-- ============================================

INSERT INTO employees
(first_name, last_name, email, department, city, salary)
VALUES
    ('Ali', 'Ahmadi', 'ali.ahmadi@gmail.com', 'Backend', 'Tehran', 3500),
    ('Sara', 'Mohammadi', 'sara.mohammadi@gmail.com', 'Frontend', 'Tehran', 4200),
    ('Reza', 'Karimi', 'reza.karimi@gmail.com', 'Backend', 'Isfahan', 5200),
    ('Nima', 'Hosseini', 'nima.hosseini@yahoo.com', 'Mobile', 'Shiraz', 3800),
    ('Mina', 'Rahimi', 'mina.rahimi@gmail.com', 'Backend', 'Tehran', 4800),
    ('Amir', 'Jafari', 'amir.jafari@company.com', 'DevOps', 'Tehran', 6000),
    ('Zahra', 'Moradi', 'zahra.moradi@gmail.com', 'Frontend', 'Mashhad', 4500);


-- ============================================
-- 3. LIKE
-- Names starting with A
-- ============================================

SELECT *
FROM employees
WHERE first_name LIKE 'A%';


-- ============================================
-- 4. Names ending with a
-- ============================================

SELECT *
FROM employees
WHERE first_name LIKE '%a';


-- ============================================
-- 5. Names containing "ar"
-- ============================================

SELECT *
FROM employees
WHERE first_name LIKE '%ar%';


-- ============================================
-- 6. Search in last names
-- ============================================

SELECT *
FROM employees
WHERE last_name LIKE '%m%';


-- ============================================
-- 7. Search emails containing Gmail
-- ============================================

SELECT *
FROM employees
WHERE email LIKE '%gmail%';


-- ============================================
-- 8. Search emails ending with Gmail domain
-- ============================================

SELECT *
FROM employees
WHERE email LIKE '%@gmail.com';


-- ============================================
-- 9. Search departments
-- ============================================

SELECT *
FROM employees
WHERE department LIKE 'Back%';


-- ============================================
-- 10. The underscore wildcard
-- Exactly one character
-- ============================================

SELECT *
FROM employees
WHERE first_name LIKE '_li';


-- ============================================
-- 11. Multiple characters with %
-- ============================================

SELECT *
FROM employees
WHERE first_name LIKE 'A%';


-- ============================================
-- 12. Combining LIKE with AND
-- ============================================

SELECT
    first_name,
    last_name,
    email,
    department
FROM employees
WHERE email LIKE '%gmail.com'
  AND department LIKE 'Back%';


-- ============================================
-- 13. Combining LIKE with OR
-- ============================================

SELECT
    first_name,
    last_name,
    department,
    city
FROM employees
WHERE first_name LIKE 'A%'
   OR last_name LIKE 'M%';


-- ============================================
-- 14. ILIKE
-- Case-insensitive search in PostgreSQL
-- ============================================

SELECT *
FROM employees
WHERE first_name ILIKE 'ali';


-- ============================================
-- 15. ILIKE with %
-- ============================================

SELECT *
FROM employees
WHERE email ILIKE '%GMAIL.COM';


-- ============================================
-- 16. ILIKE with partial text
-- ============================================

SELECT
    first_name,
    last_name,
    department
FROM employees
WHERE department ILIKE '%backend%';


-- ============================================
-- 17. Real-world search example
-- User searches for "rah"
-- ============================================

SELECT
    id,
    first_name,
    last_name,
    email,
    department
FROM employees
WHERE first_name ILIKE '%rah%'
   OR last_name ILIKE '%rah%';


-- ============================================
-- 18. Real-world product-style search
-- Search multiple columns
-- ============================================

SELECT
    id,
    first_name,
    last_name,
    department,
    city
FROM employees
WHERE first_name ILIKE '%ali%'
   OR last_name ILIKE '%ali%'
   OR email ILIKE '%ali%'
ORDER BY first_name;