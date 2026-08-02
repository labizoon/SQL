-- ==========================================
-- Topic: IS NULL / IS NOT NULL
-- Phase 02 - Filtering
-- ==========================================

-- Customers without email
SELECT *
FROM customers
WHERE email IS NULL;

-- Customers with email
SELECT *
FROM customers
WHERE email IS NOT NULL;

-- Orders without shipping date
SELECT *
FROM orders
WHERE shipping_date IS NULL;

-- Practice Questions

-- Q1. Find customers without phone numbers.
-- Q2. Find orders without shipping dates.
-- Q3. Find products with descriptions.