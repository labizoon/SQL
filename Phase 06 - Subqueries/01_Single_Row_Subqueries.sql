-- =====================================
-- SINGLE ROW SUBQUERIES
-- =====================================

-- Products more expensive than average

SELECT product_name, price
FROM products
WHERE price >
(
    SELECT AVG(price)
    FROM products
);

------------------------------------------------

-- Orders above average amount

SELECT order_id, total_amount
FROM orders
WHERE total_amount >
(
    SELECT AVG(total_amount)
    FROM orders
);

------------------------------------------------

-- Customer from same city as Ali Khan

SELECT customer_name, city
FROM customers
WHERE city =
(
    SELECT city
    FROM customers
    WHERE customer_name = 'Ali Khan'
);

------------------------------------------------

-- Cheapest products

SELECT product_name, price
FROM products
WHERE price =
(
    SELECT MIN(price)
    FROM products
);

------------------------------------------------

-- Most expensive product

SELECT product_name, price
FROM products
WHERE price =
(
    SELECT MAX(price)
    FROM products
);