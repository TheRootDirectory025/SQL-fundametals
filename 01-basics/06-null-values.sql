
-- ============================================================
-- SQL Fundamentals: NULL Values
-- ============================================================
-- NULL represents a missing or unknown value.
--
-- NULL is not the same as:
--   - 0
--   - An empty string ('')
--   - FALSE
--
-- Use IS NULL and IS NOT NULL to check for NULL values.
--
-- ============================================================


-- ------------------------------------------------------------
-- Practice Data
-- ------------------------------------------------------------

CREATE TEMP TABLE customers (
    id INTEGER,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    phone VARCHAR(20),
    age INTEGER,
    discount NUMERIC(5, 2)
);

INSERT INTO customers
    (id, full_name, email, phone, age, discount)
VALUES
    (1, 'Ali Ahmadi', 'ali@example.com', '09120000001', 28, 10.00),
    (2, 'Sara Mohammadi', 'sara@example.com', NULL, 32, NULL),
    (3, 'Reza Karimi', NULL, '09120000003', 0, 0.00),
    (4, 'Mina Hosseini', 'mina@example.com', '', NULL, 5.00),
    (5, 'Nima Rahimi', NULL, NULL, 25, NULL);


-- ------------------------------------------------------------
-- 1. Find customers without an email address
-- ------------------------------------------------------------

SELECT
    id,
    full_name,
    email
FROM customers
WHERE email IS NULL;


-- ------------------------------------------------------------
-- 2. Find customers who have an email address
-- ------------------------------------------------------------

SELECT
    id,
    full_name,
    email
FROM customers
WHERE email IS NOT NULL;


-- ------------------------------------------------------------
-- 3. Find customers without a phone number
-- ------------------------------------------------------------

SELECT
    id,
    full_name,
    phone
FROM customers
WHERE phone IS NULL;


-- ------------------------------------------------------------
-- 4. NULL is not checked with the equals operator
-- ------------------------------------------------------------
-- Incorrect:
-- WHERE email = NULL
--
-- Correct:

SELECT
    full_name,
    email
FROM customers
WHERE email IS NULL;


-- ------------------------------------------------------------
-- 5. NULL and empty strings are different
-- ------------------------------------------------------------

SELECT
    id,
    full_name,
    phone
FROM customers
WHERE phone = '';


-- ------------------------------------------------------------
-- 6. Find customers with a known age
-- ------------------------------------------------------------

SELECT
    full_name,
    age
FROM customers
WHERE age IS NOT NULL;


-- ------------------------------------------------------------
-- 7. Find customers whose age is greater than 25
-- ------------------------------------------------------------
-- Rows with NULL age are not returned because the comparison
-- evaluates to UNKNOWN.

SELECT
    full_name,
    age
FROM customers
WHERE age > 25;


-- ------------------------------------------------------------
-- 8. Use COALESCE to provide a fallback value
-- ------------------------------------------------------------
-- COALESCE returns the first non-NULL argument.

SELECT
    full_name,
    COALESCE(email, 'Not provided') AS email
FROM customers;


-- ------------------------------------------------------------
-- 9. Use COALESCE with numeric values
-- ------------------------------------------------------------
-- Display missing discounts as zero without modifying the table.

SELECT
    full_name,
    COALESCE(discount, 0.00) AS discount
FROM customers;


-- ------------------------------------------------------------
-- 10. Count NULL and non-NULL values
-- ------------------------------------------------------------
-- COUNT(column) ignores NULL values.
-- COUNT(*) counts all rows.

SELECT
    COUNT(*) AS total_customers,
    COUNT(email) AS customers_with_email,
    COUNT(*) - COUNT(email) AS customers_without_email
FROM customers;
