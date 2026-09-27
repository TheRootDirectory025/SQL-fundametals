-- ============================================================
-- SQL Fundamentals: WHERE
-- ============================================================
-- WHERE is used to filter rows based on a condition.
--
-- Basic syntax:
--
-- SELECT column_name
-- FROM table_name
-- WHERE condition;
--
-- ============================================================


-- ------------------------------------------------------------
-- Practice Data
-- ------------------------------------------------------------
-- Temporary table used only for practicing WHERE queries.

CREATE TEMP TABLE employees (
    id INTEGER,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC(10, 2)
);

INSERT INTO employees (id, first_name, last_name, department, salary)
VALUES
    (1, 'Ali', 'Ahmadi', 'Backend', 4500.00),
    (2, 'Sara', 'Mohammadi', 'Frontend', 4200.00),
    (3, 'Reza', 'Karimi', 'Backend', 5000.00),
    (4, 'Mina', 'Hosseini', 'Mobile', 4700.00),
    (5, 'Nima', 'Rahimi', 'DevOps', 5200.00);


-- ------------------------------------------------------------
-- 1. Filter rows using an exact value
-- ------------------------------------------------------------

SELECT
    *
FROM employees
WHERE department = 'Backend';


-- ------------------------------------------------------------
-- 2. Filter rows using a numeric comparison
-- ------------------------------------------------------------

SELECT
    first_name,
    salary
FROM employees
WHERE salary > 4500;


-- ------------------------------------------------------------
-- 3. Greater than or equal to
-- ------------------------------------------------------------

SELECT
    first_name,
    salary
FROM employees
WHERE salary >= 4500;


-- ------------------------------------------------------------
-- 4. Less than
-- ------------------------------------------------------------

SELECT
    first_name,
    salary
FROM employees
WHERE salary < 5000;


-- ------------------------------------------------------------
-- 5. Less than or equal to
-- ------------------------------------------------------------

SELECT
    first_name,
    salary
FROM employees
WHERE salary <= 4500;


-- ------------------------------------------------------------
-- 6. Not equal
-- ------------------------------------------------------------

SELECT
    first_name,
    department
FROM employees
WHERE department <> 'Backend';


-- ------------------------------------------------------------
-- 7. Filter using a calculated condition
-- ------------------------------------------------------------

SELECT
    first_name,
    salary,
    salary * 12 AS yearly_salary
FROM employees
WHERE salary * 12 > 55000;