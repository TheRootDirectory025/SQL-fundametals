-- ============================================
-- SQL Basics - String Functions
-- File: 14-string-functions.sql
-- Database: PostgreSQL
-- ============================================


-- ============================================
-- 1. Create sample table
-- ============================================

CREATE TEMP TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150),
    username VARCHAR(100)
);


-- ============================================
-- 2. Insert sample data
-- ============================================

INSERT INTO users
(first_name, last_name, email, username)
VALUES
    ('Ali', 'Ahmadi', '  ALI.AHMADI@GMAIL.COM  ', 'ali_ahmadi'),
    ('Sara', 'Mohammadi', 'sara.mohammadi@gmail.com', 'sara_m'),
    ('Reza', 'Karimi', 'reza.karimi@yahoo.com', 'reza_k'),
    ('Mina', 'Rahimi', 'mina.rahimi@gmail.com', 'mina_r'),
    ('Amir', 'Jafari', 'amir.jafari@company.com', 'amir_j');


-- ============================================
-- 3. UPPER
-- Convert text to uppercase
-- ============================================

SELECT
    first_name,
    UPPER(first_name) AS uppercase_name
FROM users;


-- ============================================
-- 4. LOWER
-- Convert text to lowercase
-- ============================================

SELECT
    email,
    LOWER(email) AS lowercase_email
FROM users;


-- ============================================
-- 5. TRIM
-- Remove spaces from both ends
-- ============================================

SELECT
    email,
    TRIM(email) AS trimmed_email
FROM users;


-- ============================================
-- 6. LTRIM and RTRIM
-- Remove spaces from the left or right
-- ============================================

SELECT
    TRIM(email) AS original_trimmed,
    LTRIM(email) AS left_trimmed,
    RTRIM(email) AS right_trimmed
FROM users;


-- ============================================
-- 7. LENGTH
-- Count characters
-- ============================================

SELECT
    username,
    LENGTH(username) AS username_length
FROM users;


-- ============================================
-- 8. CONCAT
-- Combine strings
-- ============================================

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM users;


-- ============================================
-- 9. CONCAT_WS
-- Combine strings with a separator
-- ============================================

SELECT
    CONCAT_WS(' ', first_name, last_name) AS full_name
FROM users;


-- ============================================
-- 10. SUBSTRING
-- Extract part of a string
-- ============================================

SELECT
    email,
    SUBSTRING(email FROM 1 FOR 3) AS first_three_chars
FROM users;


-- ============================================
-- 11. LEFT and RIGHT
-- Extract characters from either side
-- ============================================

SELECT
    email,
    LEFT(email, 5) AS first_five_chars,
    RIGHT(email, 10) AS last_ten_chars
FROM users;


-- ============================================
-- 12. POSITION
-- Find the position of a substring
-- ============================================

SELECT
    email,
    POSITION('@' IN email) AS at_position
FROM users;


-- ============================================
-- 13. REPLACE
-- Replace part of a string
-- ============================================

SELECT
    email,
    REPLACE(email, 'gmail.com', 'example.com') AS replaced_email
FROM users;


-- ============================================
-- 14. REPEAT
-- Repeat a string
-- ============================================

SELECT REPEAT('*', 10) AS stars;


-- ============================================
-- 15. REVERSE
-- Reverse a string
-- ============================================

SELECT
    username,
    REVERSE(username) AS reversed_username
FROM users;


-- ============================================
-- 16. SPLIT_PART
-- Extract a section separated by a delimiter
-- ============================================

SELECT
    email,
    SPLIT_PART(email, '@', 1) AS email_local_part,
    SPLIT_PART(email, '@', 2) AS email_domain
FROM users;


-- ============================================
-- 17. INITCAP
-- Capitalize the first letter of each word
-- ============================================

SELECT
    LOWER(first_name) AS original_name,
    INITCAP(LOWER(first_name)) AS formatted_name
FROM users;


-- ============================================
-- 18. Normalize email formatting
-- ============================================

SELECT
    id,
    LOWER(TRIM(email)) AS normalized_email
FROM users;


-- ============================================
-- 19. Search after normalizing text
-- ============================================

SELECT
    id,
    first_name,
    email
FROM users
WHERE LOWER(TRIM(email)) LIKE '%@gmail.com';


-- ============================================
-- 20. Build a user profile label
-- ============================================

SELECT
    id,
    CONCAT_WS(
            ' | ',
            CONCAT_WS(' ', first_name, last_name),
            LOWER(TRIM(email)),
            CONCAT('@', username)
    ) AS profile_label
FROM users;


-- ============================================
-- 21. Find usernames containing underscore
-- ============================================

SELECT
    username,
    POSITION('_' IN username) AS underscore_position
FROM users
WHERE POSITION('_' IN username) > 0;


-- ============================================
-- 22. Real-world example
-- Generate a cleaned user report
-- ============================================

SELECT
    id,
    INITCAP(LOWER(TRIM(first_name))) AS first_name,
    INITCAP(LOWER(TRIM(last_name))) AS last_name,
    LOWER(TRIM(email)) AS email,
    LENGTH(TRIM(username)) AS username_length,
    SPLIT_PART(LOWER(TRIM(email)), '@', 2) AS email_domain
FROM users
ORDER BY first_name;