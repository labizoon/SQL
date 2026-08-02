-- ===========================================
-- MIN() and MAX() Functions
-- ===========================================

-- Lowest product price
SELECT MIN(price)
FROM products;

-- Highest product price
SELECT MAX(price)
FROM products;

-- Lowest order amount
SELECT MIN(total_amount)
FROM orders;

-- Highest order amount
SELECT MAX(total_amount)
FROM orders;

-- First customer registration
SELECT MIN(registration_date)
FROM customers;

-- Latest customer registration
SELECT MAX(registration_date)
FROM customers;