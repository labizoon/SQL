-- ==========================================
-- Topic: WHERE Clause
-- ==========================================

SELECT *
FROM customers
WHERE city='Lahore';

SELECT *
FROM products
WHERE price > 5000;

SELECT *
FROM orders
WHERE total_amount >= 10000;

-- Practice

-- Q1. Customers from Karachi.
-- Q2. Products cheaper than 1000.
-- Q3. Orders greater than 5000.