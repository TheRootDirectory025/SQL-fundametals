-- ============================================
-- SQL Basics - Basic Calculations
-- File: 15-basic-calculations.sql
-- Database: PostgreSQL
-- ============================================


-- ============================================
-- 1. Basic arithmetic operators
-- ============================================

SELECT
    10 + 5 AS addition,
    10 - 5 AS subtraction,
    10 * 5 AS multiplication,
    10 / 5 AS division,
    10 % 3 AS remainder;


-- ============================================
-- 2. Integer division vs decimal division
-- ============================================

SELECT
    10 / 3 AS integer_division,
    10.0 / 3 AS decimal_division,
    10::NUMERIC / 3 AS numeric_division;


-- ============================================
-- 3. Power and square root
-- ============================================

SELECT
    POWER(2, 3) AS power_result,
    SQRT(81) AS square_root;


-- ============================================
-- 4. ABS and ROUND
-- ============================================

SELECT
    ABS(-250) AS absolute_value,
    ROUND(123.456::NUMERIC, 2) AS rounded_value,
    TRUNC(123.456::NUMERIC, 2) AS truncated_value;


-- ============================================
-- 5. Create sample products table
-- ============================================

CREATE TEMP TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    quantity INTEGER NOT NULL,
    discount_percent NUMERIC(5, 2) NOT NULL DEFAULT 0,
    tax_percent NUMERIC(5, 2) NOT NULL DEFAULT 0
);


-- ============================================
-- 6. Insert sample products
-- ============================================

INSERT INTO products
(product_name, price, quantity, discount_percent, tax_percent)
VALUES
    ('Keyboard', 50.00, 10, 10, 9),
    ('Mouse', 25.00, 20, 5, 9),
    ('Monitor', 250.00, 5, 15, 9),
    ('Headphones', 80.00, 8, 0, 9),
    ('Webcam', 100.00, 4, 12, 9);


-- ============================================
-- 7. Calculate inventory value
-- ============================================

SELECT
    product_name,
    price,
    quantity,
    price * quantity AS inventory_value
FROM products;


-- ============================================
-- 8. Calculate discount amount
-- ============================================

SELECT
    product_name,
    price,
    discount_percent,
    ROUND(
            price * discount_percent / 100,
            2
    ) AS discount_amount
FROM products;


-- ============================================
-- 9. Calculate price after discount
-- ============================================

SELECT
    product_name,
    price,
    discount_percent,
    ROUND(
            price * (1 - discount_percent / 100),
            2
    ) AS discounted_price
FROM products;


-- ============================================
-- 10. Calculate tax amount after discount
-- ============================================

SELECT
    product_name,
    price,
    discount_percent,
    tax_percent,
    ROUND(
            price * (1 - discount_percent / 100)
                * tax_percent / 100,
            2
    ) AS tax_amount
FROM products;


-- ============================================
-- 11. Calculate final price including tax
-- ============================================

SELECT
    product_name,
    price,
    discount_percent,
    tax_percent,
    ROUND(
            price
                * (1 - discount_percent / 100)
                * (1 + tax_percent / 100),
            2
    ) AS final_price
FROM products;


-- ============================================
-- 12. Calculate total revenue per product
-- ============================================

SELECT
    product_name,
    price,
    quantity,
    ROUND(
            price
                * (1 - discount_percent / 100)
                * (1 + tax_percent / 100)
                * quantity,
            2
    ) AS total_revenue
FROM products
ORDER BY total_revenue DESC;


-- ============================================
-- 13. Calculate discount savings for all units
-- ============================================

SELECT
    product_name,
    quantity,
    ROUND(
            price * discount_percent / 100 * quantity,
            2
    ) AS total_discount
FROM products;


-- ============================================
-- 14. Calculate average price per unit
-- ============================================

SELECT
    product_name,
    price,
    quantity,
    ROUND(price / quantity, 2) AS price_per_quantity_unit
FROM products;


-- ============================================
-- 15. Compare products against a budget
-- ============================================

SELECT
    product_name,
    price,
    CASE
        WHEN price <= 50 THEN 'Within Budget'
        ELSE 'Over Budget'
        END AS budget_status
FROM products;


-- ============================================
-- 16. Calculate price difference from a target
-- ============================================

SELECT
    product_name,
    price,
    price - 100 AS difference_from_100,
    ABS(price - 100) AS absolute_difference
FROM products;


-- ============================================
-- 17. Apply a hypothetical 10% price increase
-- ============================================

SELECT
    product_name,
    price AS current_price,
    ROUND(price * 1.10, 2) AS increased_price
FROM products;


-- ============================================
-- 18. Calculate the weighted total value
-- ============================================

SELECT
    product_name,
    price,
    quantity,
    price * quantity AS total_value,
    ROUND(
            price * quantity
                / SUM(price * quantity) OVER () * 100,
            2
    ) AS percentage_of_inventory_value
FROM products
ORDER BY total_value DESC;


-- ============================================
-- 19. Avoid division by zero
-- ============================================

SELECT
    100::NUMERIC / NULLIF(0, 0) AS safe_division;


-- ============================================
-- 20. Real-world product report
-- ============================================

SELECT
    product_name,
    price,
    quantity,
    discount_percent,
    tax_percent,
    ROUND(price * quantity, 2) AS original_total,
    ROUND(
            price * discount_percent / 100 * quantity,
            2
    ) AS discount_total,
    ROUND(
            price
                * (1 - discount_percent / 100)
                * (1 + tax_percent / 100),
            2
    ) AS final_unit_price,
    ROUND(
            price
                * (1 - discount_percent / 100)
                * (1 + tax_percent / 100)
                * quantity,
            2
    ) AS final_total
FROM products
ORDER BY final_total DESC;