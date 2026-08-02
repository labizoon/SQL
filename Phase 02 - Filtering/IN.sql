-- ==========================================
-- Topic: IN Operator
-- Phase 02 - Filtering
-- ==========================================

-- Customers from Lahore or Karachi
SELECT *
FROM customers
WHERE city IN ('Lahore','Karachi');

-- Products from Electronics and Stationery
SELECT *
FROM products
WHERE category IN ('Electronics','Stationery');

-- Orders from selected customers
SELECT *
FROM orders
WHERE customer_id IN (1,3,5);

-- Practice Questions

-- Q1. Find customers from Islamabad and Lahore.
-- Q2. Find products in Electronics.
-- Q3. Find orders placed by customers 2 and 4.