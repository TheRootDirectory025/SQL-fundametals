
-- ============================================================
-- SQL Fundamentals: LIMIT and OFFSET
-- ============================================================
-- LIMIT restricts the number of rows returned by a query.
-- OFFSET skips a specified number of rows before returning
-- results.
--
-- Basic syntax:
--
-- SELECT column_name
-- FROM table_name
-- ORDER BY column_name
-- LIMIT row_count OFFSET row_count;
--
-- ============================================================


-- ------------------------------------------------------------
-- Practice Data
-- ------------------------------------------------------------

CREATE TEMP TABLE products (
                               id INTEGER,
                               name VARCHAR(100),
                               category VARCHAR(50),
                               price NUMERIC(10, 2),
                               created_at DATE
);

INSERT INTO products (id, name, category, price, created_at)
VALUES
    (1, 'Laptop Pro', 'Electronics', 1200.00, '2026-01-10'),
    (2, 'Wireless Mouse', 'Accessories', 25.00, '2026-02-15'),
    (3, 'Mechanical Keyboard', 'Accessories', 85.00, '2026-03-05'),
    (4, 'Gaming Laptop', 'Electronics', 1500.00, '2026-04-20'),
    (5, 'USB-C Hub', 'Accessories', 45.00, '2026-05-12'),
    (6, 'Smartphone', 'Electronics', 800.00, '2026-06-18'),
    (7, 'Monitor', 'Electronics', 300.00, '2026-07-01'),
    (8, 'Webcam', 'Accessories', 70.00, '2026-08-09');


-- ------------------------------------------------------------
-- 1. Return only the first three rows
-- ------------------------------------------------------------

SELECT
    id,
    name,
    price
FROM products
ORDER BY id
LIMIT 3;


-- ------------------------------------------------------------
-- 2. Find the three most expensive products
-- ------------------------------------------------------------

SELECT
    name,
    price
FROM products
ORDER BY price DESC, id ASC
LIMIT 3;


-- ------------------------------------------------------------
-- 3. Find the cheapest product
-- ------------------------------------------------------------

SELECT
    name,
    price
FROM products
ORDER BY price ASC, id ASC
LIMIT 1;


-- ------------------------------------------------------------
-- 4. Skip the first three rows
-- ------------------------------------------------------------

SELECT
    id,
    name
FROM products
ORDER BY id
OFFSET 3;


-- ------------------------------------------------------------
-- 5. Combine LIMIT and OFFSET
-- ------------------------------------------------------------
-- Return three rows after skipping the first two rows.

SELECT
    id,
    name,
    price
FROM products
ORDER BY id
LIMIT 3 OFFSET 2;


-- ------------------------------------------------------------
-- 6. Simulate the second page of a paginated API
-- ------------------------------------------------------------
-- Page size: 3
-- Page number: 2
-- Offset = (page_number - 1) * page_size = 3

SELECT
    id,
    name,
    price
FROM products
ORDER BY id
LIMIT 3 OFFSET 3;


-- ------------------------------------------------------------
-- 7. Combine filtering, sorting, and limiting
-- ------------------------------------------------------------
-- Return the two most expensive Electronics products.

SELECT
    name,
    category,
    price
FROM products
WHERE category = 'Electronics'
ORDER BY price DESC, id ASC
LIMIT 2;


-- ------------------------------------------------------------
-- 8. Return the newest products
-- ------------------------------------------------------------

SELECT
    name,
    created_at
FROM products
ORDER BY created_at DESC, id DESC
LIMIT 3;


-- ------------------------------------------------------------
-- 9. Return no rows
-- ------------------------------------------------------------

SELECT
    id,
    name
FROM products
LIMIT 0;
