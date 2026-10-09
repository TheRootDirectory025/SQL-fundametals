-- ============================================
-- SQL Basics - Type Casting
-- File: 13-type-casting.sql
-- Database: PostgreSQL
-- ============================================


-- ============================================
-- 1. CAST: Convert text to integer
-- ============================================

SELECT CAST('123' AS INTEGER) AS converted_integer;


-- ============================================
-- 2. PostgreSQL casting operator ::
-- ============================================

SELECT '123'::INTEGER AS converted_integer;


-- ============================================
-- 3. Convert text to numeric
-- ============================================

SELECT CAST('1250.75' AS NUMERIC(10, 2)) AS converted_price;


-- ============================================
-- 4. Convert numeric to integer
-- ============================================

SELECT CAST(1250.75 AS INTEGER) AS converted_integer;


-- ============================================
-- 5. Convert integer to text
-- ============================================

SELECT CAST(2026 AS TEXT) AS converted_text;


-- ============================================
-- 6. Convert numeric to text
-- ============================================

SELECT 1250.75::TEXT AS price_text;


-- ============================================
-- 7. Convert text to date
-- ============================================

SELECT CAST('2026-10-09' AS DATE) AS converted_date;


-- ============================================
-- 8. Convert text to timestamp
-- ============================================

SELECT
    CAST('2026-10-09 14:30:00' AS TIMESTAMP)
        AS converted_timestamp;


-- ============================================
-- 9. Convert text to boolean
-- ============================================

SELECT
    CAST('true' AS BOOLEAN) AS enabled,
    CAST('false' AS BOOLEAN) AS disabled;


-- ============================================
-- 10. Convert values inside calculations
-- ============================================

SELECT
    CAST('100' AS INTEGER)
        + CAST('250' AS INTEGER) AS total;


-- ============================================
-- 11. Casting with a table
-- ============================================

CREATE TEMP TABLE product_imports (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price_text VARCHAR(30),
    quantity_text VARCHAR(30)
);


INSERT INTO product_imports
(product_name, price_text, quantity_text)
VALUES
    ('Keyboard', '45.50', '10'),
    ('Mouse', '20.00', '25'),
    ('Monitor', '180.75', '5');


-- ============================================
-- 12. Convert imported text to numeric
-- ============================================

SELECT
    product_name,
    price_text,
    CAST(price_text AS NUMERIC(10, 2)) AS price
FROM product_imports;


-- ============================================
-- 13. Calculate inventory value
-- ============================================

SELECT
    product_name,
    CAST(price_text AS NUMERIC(10, 2)) AS price,
    CAST(quantity_text AS INTEGER) AS quantity,
    CAST(price_text AS NUMERIC(10, 2))
        * CAST(quantity_text AS INTEGER) AS inventory_value
FROM product_imports;


-- ============================================
-- 14. Casting with the :: operator
-- ============================================

SELECT
    product_name,
    price_text::NUMERIC(10, 2) AS price,
    quantity_text::INTEGER AS quantity
FROM product_imports;


-- ============================================
-- 15. ROUND after casting
-- ============================================

SELECT
    product_name,
    ROUND(
            price_text::NUMERIC * quantity_text::INTEGER,
            2
    ) AS inventory_value
FROM product_imports;


-- ============================================
-- 16. Convert date text to DATE
-- ============================================

CREATE TEMP TABLE event_imports (
    id SERIAL PRIMARY KEY,
    event_name VARCHAR(100),
    event_date_text VARCHAR(30)
);


INSERT INTO event_imports (event_name, event_date_text)
VALUES
    ('Conference', '2026-10-09'),
    ('Workshop', '2026-10-15'),
    ('Interview', '2026-10-20');


SELECT
    event_name,
    event_date_text::DATE AS event_date
FROM event_imports
ORDER BY event_date;


-- ============================================
-- 17. Casting in a WHERE condition
-- ============================================

SELECT *
FROM product_imports
WHERE price_text::NUMERIC > 40;


-- ============================================
-- 18. Casting and aliases
-- ============================================

SELECT
    product_name,
    price_text::NUMERIC(10, 2) AS price,
    quantity_text::INTEGER AS quantity,
    price_text::NUMERIC(10, 2)
        * quantity_text::INTEGER AS total_value
FROM product_imports
ORDER BY total_value DESC;