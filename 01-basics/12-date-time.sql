-- ============================================
-- SQL Basics - Date and Time
-- File: 12-date-time.sql
-- Database: PostgreSQL
-- ============================================


-- ============================================
-- 1. Create sample table
-- ============================================

CREATE TEMP TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL,
    order_date DATE NOT NULL,
    created_at TIMESTAMP NOT NULL
);


-- ============================================
-- 2. Insert sample data
-- ============================================

INSERT INTO orders
(customer_name, total_amount, order_date, created_at)
VALUES
    ('Ali', 150.00, '2026-01-10', '2026-01-10 09:30:00'),
    ('Sara', 275.50, '2026-01-15', '2026-01-15 14:45:00'),
    ('Reza', 99.99, '2026-02-05', '2026-02-05 11:20:00'),
    ('Mina', 420.00, '2026-02-18', '2026-02-18 16:10:00'),
    ('Amir', 180.75, '2026-03-02', '2026-03-02 08:15:00');


-- ============================================
-- 3. Select date columns
-- ============================================

SELECT
    customer_name,
    order_date,
    created_at
FROM orders;


-- ============================================
-- 4. CURRENT_DATE
-- Get the current date
-- ============================================

SELECT CURRENT_DATE AS today;


-- ============================================
-- 5. CURRENT_TIME
-- Get the current time
-- ============================================

SELECT CURRENT_TIME AS current_time;


-- ============================================
-- 6. CURRENT_TIMESTAMP
-- Get the current date and time
-- ============================================

SELECT CURRENT_TIMESTAMP AS current_timestamp;


-- ============================================
-- 7. Filter by an exact date
-- ============================================

SELECT *
FROM orders
WHERE order_date = DATE '2026-02-05';


-- ============================================
-- 8. Filter by date range
-- ============================================

SELECT *
FROM orders
WHERE order_date BETWEEN DATE '2026-01-01'
          AND DATE '2026-01-31';


-- ============================================
-- 9. Orders after a specific date
-- ============================================

SELECT *
FROM orders
WHERE order_date > DATE '2026-01-15';


-- ============================================
-- 10. Sort by date
-- ============================================

SELECT *
FROM orders
ORDER BY order_date DESC;


-- ============================================
-- 11. Extract year, month, and day
-- ============================================

SELECT
    customer_name,
    order_date,
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(DAY FROM order_date) AS order_day
FROM orders;


-- ============================================
-- 12. Extract hour and minute
-- ============================================

SELECT
    customer_name,
    created_at,
    EXTRACT(HOUR FROM created_at) AS order_hour,
    EXTRACT(MINUTE FROM created_at) AS order_minute
FROM orders;


-- ============================================
-- 13. DATE_PART
-- Alternative way to extract date parts
-- ============================================

SELECT
    customer_name,
    order_date,
    DATE_PART('year', order_date) AS order_year,
    DATE_PART('month', order_date) AS order_month
FROM orders;


-- ============================================
-- 14. Calculate days between dates
-- ============================================

SELECT
    customer_name,
    order_date,
    CURRENT_DATE - order_date AS days_since_order
FROM orders;


-- ============================================
-- 15. Add an interval to a date
-- ============================================

SELECT
    order_date,
    order_date + INTERVAL '7 days' AS date_after_one_week
FROM orders;


-- ============================================
-- 16. Subtract an interval
-- ============================================

SELECT
    order_date,
    order_date - INTERVAL '1 month' AS date_one_month_earlier
FROM orders;


-- ============================================
-- 17. Filter timestamps by a time range
-- ============================================

SELECT *
FROM orders
WHERE created_at >= TIMESTAMP '2026-02-01 00:00:00'
  AND created_at <  TIMESTAMP '2026-03-01 00:00:00';


-- ============================================
-- 18. Group orders by month
-- ============================================

SELECT
    DATE_TRUNC('month', order_date) AS order_month,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY order_month;


-- ============================================
-- 19. Group orders by day
-- ============================================

SELECT
    order_date,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY order_date
ORDER BY order_date;


-- ============================================
-- 20. Real-world example
-- Monthly revenue report
-- ============================================

SELECT
    DATE_TRUNC('month', order_date)::DATE AS month,
    COUNT(*) AS order_count,
    ROUND(SUM(total_amount), 2) AS revenue
FROM orders
WHERE order_date >= DATE '2026-01-01'
  AND order_date < DATE '2026-04-01'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;