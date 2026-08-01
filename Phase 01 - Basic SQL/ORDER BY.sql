-- ==========================================
-- Topic: ORDER BY
-- ==========================================

SELECT *
FROM customers
ORDER BY customer_name;

SELECT *
FROM products
ORDER BY price DESC;

SELECT *
FROM orders
ORDER BY total_amount ASC;

-- Practice

-- Q1. Sort products by price.
-- Q2. Sort customers alphabetically.