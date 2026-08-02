-- ===========================================
-- HAVING
-- ===========================================

-- Cities having more than one customer
SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 1;

-- Categories with average price greater than 5000
SELECT category,
       AVG(price) AS average_price
FROM products
GROUP BY category
HAVING AVG(price) > 5000;

-- Customers spending more than 10000
SELECT customer_id,
       SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 10000;

-- Customers having more than one order
SELECT customer_id,
       COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Categories with more than two products
SELECT category,
       COUNT(*) AS total_products
FROM products
GROUP BY category
HAVING COUNT(*) > 2;

-- Categories where the highest price is above 10000
SELECT category,
       MAX(price) AS highest_price
FROM products
GROUP BY category
HAVING MAX(price) > 10000;