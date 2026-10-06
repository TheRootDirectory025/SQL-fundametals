
-- ============================================================
-- SQL Fundamentals: ORDER BY
-- ============================================================
-- ORDER BY is used to sort query results by one or more columns.
--
-- ASC  : Ascending order (default)
-- DESC : Descending order
--
-- Basic syntax:
--
-- SELECT column_name
-- FROM table_name
-- ORDER BY column_name [ASC | DESC];
--
-- ============================================================


-- ------------------------------------------------------------
-- Practice Data
-- ------------------------------------------------------------
-- Temporary table used only for practicing ORDER BY queries.

CREATE TEMP TABLE employees (
    id INTEGER,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC(10, 2),
    hire_date DATE
);

INSERT INTO employees
    (id, first_name, last_name, department, salary, hire_date)
VALUES
    (1, 'Ali', 'Ahmadi', 'Backend', 4500.00, '2024-03-15'),
    (2, 'Sara', 'Mohammadi', 'Frontend', 4200.00, '2023-07-10'),
    (3, 'Reza', 'Karimi', 'Backend', 5000.00, '2022-11-20'),
    (4, 'Mina', 'Hosseini', 'Mobile', 4700.00, '2025-01-05'),
    (5, 'Nima', 'Rahimi', 'DevOps', 5200.00, '2023-02-18');


-- ------------------------------------------------------------
-- 1. Sort by salary in ascending order
-- ------------------------------------------------------------

SELECT
    first_name,
    salary
FROM employees
ORDER BY salary ASC;


-- ------------------------------------------------------------
-- 2. Sort by salary in descending order
-- ------------------------------------------------------------

SELECT
    first_name,
    salary
FROM employees
ORDER BY salary DESC;


-- ------------------------------------------------------------
-- 3. Sort alphabetically by first name
-- ------------------------------------------------------------

SELECT
    first_name,
    last_name
FROM employees
ORDER BY first_name ASC;


-- ------------------------------------------------------------
-- 4. Sort by multiple columns
-- ------------------------------------------------------------
-- Rows are first sorted by department.
-- Within each department, they are sorted by salary descending.

SELECT
    first_name,
    department,
    salary
FROM employees
ORDER BY department ASC, salary DESC;


-- ------------------------------------------------------------
-- 5. Sort by a calculated expression
-- ------------------------------------------------------------

SELECT
    first_name,
    salary,
    salary * 12 AS yearly_salary
FROM employees
ORDER BY salary * 12 DESC;


-- ------------------------------------------------------------
-- 6. Sort by a column alias
-- ------------------------------------------------------------

SELECT
    first_name,
    salary * 12 AS yearly_salary
FROM employees
ORDER BY yearly_salary DESC;


-- ------------------------------------------------------------
-- 7. Sort by the most recent hire date
-- ------------------------------------------------------------

SELECT
    first_name,
    hire_date
FROM employees
ORDER BY hire_date DESC;


-- ------------------------------------------------------------
-- 8. Combine filtering and sorting
-- ------------------------------------------------------------
-- Find Backend employees and show the highest-paid first.

SELECT
    first_name,
    salary
FROM employees
WHERE department = 'Backend'
ORDER BY salary DESC;


-- ------------------------------------------------------------
-- 9. Control NULL placement
-- ------------------------------------------------------------
-- NULL values are placed last, regardless of the sort direction.

SELECT
    first_name,
    salary
FROM employees
ORDER BY salary DESC NULLS LAST;
