-- ============================================
-- SQL Basics - CASE
-- File: 11-case.sql
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
    salary NUMERIC(10, 2)
);


-- ============================================
-- 2. Insert sample data
-- ============================================

INSERT INTO employees
(first_name, last_name, department, age, salary)
VALUES
    ('Ali', 'Ahmadi', 'Backend', 24, 3500),
    ('Sara', 'Mohammadi', 'Frontend', 27, 4200),
    ('Reza', 'Karimi', 'Backend', 31, 5200),
    ('Nima', 'Hosseini', 'Mobile', 23, 3800),
    ('Mina', 'Rahimi', 'Backend', 29, 4800),
    ('Amir', 'Jafari', 'DevOps', 34, 6000);


-- ============================================
-- 3. Simple CASE
-- ============================================

SELECT
    first_name,
    department,
    CASE department
        WHEN 'Backend' THEN 'Backend Developer'
        WHEN 'Frontend' THEN 'Frontend Developer'
        WHEN 'Mobile' THEN 'Mobile Developer'
        WHEN 'DevOps' THEN 'DevOps Engineer'
        ELSE 'Other'
        END AS job_title
FROM employees;


-- ============================================
-- 4. Searched CASE
-- CASE with conditions
-- ============================================

SELECT
    first_name,
    salary,
    CASE
        WHEN salary < 4000 THEN 'Low'
        WHEN salary BETWEEN 4000 AND 5000 THEN 'Medium'
        WHEN salary > 5000 THEN 'High'
        ELSE 'Unknown'
        END AS salary_level
FROM employees;


-- ============================================
-- 5. Age classification
-- ============================================

SELECT
    first_name,
    age,
    CASE
        WHEN age < 25 THEN 'Junior Age'
        WHEN age BETWEEN 25 AND 30 THEN 'Mid Age'
        ELSE 'Senior Age'
        END AS age_group
FROM employees;


-- ============================================
-- 6. Multiple conditions
-- ============================================

SELECT
    first_name,
    department,
    salary,
    CASE
        WHEN department = 'Backend' AND salary >= 5000
            THEN 'Senior Backend'
        WHEN department = 'Backend'
            THEN 'Backend Developer'
        WHEN department = 'Frontend'
            THEN 'Frontend Developer'
        ELSE 'Other'
        END AS employee_role
FROM employees;


-- ============================================
-- 7. CASE with calculated value
-- ============================================

SELECT
    first_name,
    salary,
    CASE
        WHEN salary >= 5000 THEN salary * 1.15
        WHEN salary >= 4000 THEN salary * 1.10
        ELSE salary * 1.05
        END AS salary_after_raise
FROM employees;


-- ============================================
-- 8. CASE with ORDER BY
-- ============================================

SELECT
    first_name,
    department,
    salary,
    CASE
        WHEN salary >= 5000 THEN 'High'
        WHEN salary >= 4000 THEN 'Medium'
        ELSE 'Low'
        END AS salary_level
FROM employees
ORDER BY
    CASE
        WHEN salary >= 5000 THEN 1
        WHEN salary >= 4000 THEN 2
        ELSE 3
        END;


-- ============================================
-- 9. Real-world example
-- Employee performance category
-- ============================================

SELECT
    first_name,
    department,
    salary,
    CASE
        WHEN department = 'Backend' AND salary >= 5000
            THEN 'Experienced Backend'
        WHEN department = 'Backend'
            THEN 'Backend Developer'
        WHEN department = 'DevOps' AND salary >= 5500
            THEN 'Experienced DevOps'
        WHEN department = 'Frontend'
            THEN 'Frontend Developer'
        ELSE 'Other'
        END AS category
FROM employees
ORDER BY salary DESC;


-- ============================================
-- 10. CASE with calculated yearly salary
-- ============================================

SELECT
    first_name,
    salary,
    salary * 12 AS yearly_salary,
    CASE
        WHEN salary * 12 >= 60000 THEN 'High Annual Salary'
        WHEN salary * 12 >= 48000 THEN 'Medium Annual Salary'
        ELSE 'Low Annual Salary'
        END AS salary_category
FROM employees
ORDER BY yearly_salary DESC;