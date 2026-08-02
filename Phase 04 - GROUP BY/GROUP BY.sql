-- ===========================================
-- GROUP BY
-- ===========================================

-- Count customers in each city
SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- Count products in each category
SELECT category,
       COUNT(*) AS total_products
FROM products
GROUP BY category;

-- Average price by category
SELECT category,
       AVG(price) AS average_price
FROM products
GROUP BY category;

-- Maximum price by category
SELECT category,
       MAX(price) AS highest_price
FROM products
GROUP BY category;

-- Minimum price by category
SELECT category,
       MIN(price) AS lowest_price
FROM products
GROUP BY category;

-- Total sales by customer
SELECT customer_id,
       SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;

-- Number of orders per customer
SELECT customer_id,
       COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;

-- Average order amount per customer
SELECT customer_id,
       AVG(total_amount) AS average_order
FROM orders
GROUP BY customer_id;