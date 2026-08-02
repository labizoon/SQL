-- ===========================================
-- COUNT() Function
-- ===========================================

-- Count all customers
SELECT COUNT(*)
FROM customers;

-- Count customers from Lahore
SELECT COUNT(*)
FROM customers
WHERE city = 'Lahore';

-- Count products
SELECT COUNT(*)
FROM products;

-- Count orders
SELECT COUNT(*)
FROM orders;

-- Count customers with email
SELECT COUNT(email)
FROM customers;

-- Count distinct cities
SELECT COUNT(DISTINCT city)
FROM customers;