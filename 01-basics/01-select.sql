-- ============================================================
-- SQL Fundamentals: SELECT
-- ============================================================
-- SELECT is used to retrieve data from one or more columns
-- of a table.
--
-- Basic syntax:
--
-- SELECT column_name
-- FROM table_name;
--
-- ============================================================


-- ------------------------------------------------------------
-- Practice Data
-- ------------------------------------------------------------
-- Temporary table used only for practicing SELECT queries.
-- The table is automatically removed when the database session
-- ends.

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
-- 1. Select all columns
-- ------------------------------------------------------------

SELECT *
FROM employees;


-- ------------------------------------------------------------
-- 2. Select specific columns
-- ------------------------------------------------------------

SELECT
    first_name,
    last_name
FROM employees;


-- ------------------------------------------------------------
-- 3. Select multiple columns
-- ------------------------------------------------------------

SELECT
    id,
    first_name,
    last_name,
    department
FROM employees;


-- ------------------------------------------------------------
-- 4. Select a single column
-- ------------------------------------------------------------

SELECT department
FROM employees;


-- ------------------------------------------------------------
-- 5. Select a column with an alias
-- ------------------------------------------------------------

SELECT
    first_name AS name,
    salary AS monthly_salary
FROM employees;


-- ------------------------------------------------------------
-- 6. Select an expression
-- ------------------------------------------------------------
-- SQL can perform calculations while retrieving data.

SELECT
    first_name,
    salary,
    salary * 12 AS yearly_salary
FROM employees;


-- ------------------------------------------------------------
-- 7. Select a constant value
-- ------------------------------------------------------------

SELECT
    first_name,
    'Employee' AS role
FROM employees;