-- ==========================================
-- Topic: BETWEEN Operator
-- Phase 02 - Filtering
-- ==========================================

-- Products priced between 1000 and 10000
SELECT *
FROM products
WHERE price BETWEEN 1000 AND 10000;

-- Orders between two amounts
SELECT *
FROM orders
WHERE total_amount BETWEEN 5000 AND 25000;

-- Customers registered in 2025
SELECT *
FROM customers
WHERE registration_date
BETWEEN '2025-01-01' AND '2025-12-31';

-- Practice Questions

-- Q1. Products priced between 500 and 5000.
-- Q2. Orders between 10000 and 50000.
-- Q3. Customers registered in January 2025.