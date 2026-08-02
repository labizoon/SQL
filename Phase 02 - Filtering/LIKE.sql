-- ==========================================
-- Topic: LIKE Operator
-- Phase 02 - Filtering
-- ==========================================

-- Customers whose names start with 'A'
SELECT *
FROM customers
WHERE customer_name LIKE 'A%';

-- Customers whose names end with 'n'
SELECT *
FROM customers
WHERE customer_name LIKE '%n';

-- Customers whose names contain 'ar'
SELECT *
FROM customers
WHERE customer_name LIKE '%ar%';

-- Customers whose names have exactly 5 characters
SELECT *
FROM customers
WHERE customer_name LIKE '_____';

-- Products starting with 'L'
SELECT *
FROM products
WHERE product_name LIKE 'L%';

-- Practice Questions

-- Q1. Find customers whose names start with 'S'.
-- Q2. Find products ending with 'e'.
-- Q3. Find customers whose names contain 'Ali'.
-- Q4. Find products whose names have exactly 4 letters.