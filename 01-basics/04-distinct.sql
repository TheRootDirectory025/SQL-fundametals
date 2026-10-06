
-- ============================================================
-- SQL Fundamentals: DISTINCT
-- ============================================================
-- DISTINCT removes duplicate rows from the query result.
--
-- Basic syntax:
--
-- SELECT DISTINCT column_name
-- FROM table_name;
--
-- When multiple columns are selected, DISTINCT considers
-- the combination of all selected columns.
--
-- ============================================================


-- ------------------------------------------------------------
-- Practice Data
-- ------------------------------------------------------------

CREATE TEMP TABLE products (
                               id INTEGER,
                               name VARCHAR(100),
                               category VARCHAR(50),
                               brand VARCHAR(50),
                               price NUMERIC(10, 2)
);

INSERT INTO products (id, name, category, brand, price)
VALUES
    (1, 'Laptop Pro', 'Electronics', 'TechNova', 1200.00),
    (2, 'Wireless Mouse', 'Accessories', 'TechNova', 25.00),
    (3, 'Mechanical Keyboard', 'Accessories', 'KeyWorks', 85.00),
    (4, 'Gaming Laptop', 'Electronics', 'GameCore', 1500.00),
    (5, 'USB-C Hub', 'Accessories', 'TechNova', 45.00),
    (6, 'Smartphone', 'Electronics', 'MobileOne', 800.00),
    (7, 'Monitor', 'Electronics', 'ViewMax', 300.00);


-- ------------------------------------------------------------
-- 1. Select all distinct categories
-- ------------------------------------------------------------

SELECT DISTINCT
    category
FROM products;


-- ------------------------------------------------------------
-- 2. Select all distinct brands
-- ------------------------------------------------------------

SELECT DISTINCT
    brand
FROM products;


-- ------------------------------------------------------------
-- 3. DISTINCT with multiple columns
-- ------------------------------------------------------------
-- Returns unique combinations of category and brand.

SELECT DISTINCT
    category,
    brand
FROM products;


-- ------------------------------------------------------------
-- 4. DISTINCT with WHERE
-- ------------------------------------------------------------
-- Find the distinct brands that sell Electronics products.

SELECT DISTINCT
    brand
FROM products
WHERE category = 'Electronics';


-- ------------------------------------------------------------
-- 5. DISTINCT with ORDER BY
-- ------------------------------------------------------------
-- List unique categories alphabetically.

SELECT DISTINCT
    category
FROM products
ORDER BY category ASC;


-- ------------------------------------------------------------
-- 6. DISTINCT with multiple columns and ORDER BY
-- ------------------------------------------------------------

SELECT DISTINCT
    category,
    brand
FROM products
ORDER BY category ASC, brand ASC;


-- ------------------------------------------------------------
-- 7. Count distinct values
-- ------------------------------------------------------------
-- Count the number of unique categories.

SELECT
    COUNT(DISTINCT category) AS category_count
FROM products;


-- ------------------------------------------------------------
-- 8. DISTINCT does not remove rows from the table
-- ------------------------------------------------------------
-- It only removes duplicates from the query result.

SELECT
    id,
    name,
    category
FROM products
ORDER BY id;