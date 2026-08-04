-- =====================================
-- MULTIPLE ROW SUBQUERIES
-- =====================================

-- Products ordered by customer 1

SELECT product_name
FROM products
WHERE product_id IN
(
    SELECT product_id
    FROM order_items
    WHERE order_id IN
    (
        SELECT order_id
        FROM orders
        WHERE customer_id = 1
    )
);

------------------------------------------------

-- Customers who placed orders

SELECT customer_name
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
);

------------------------------------------------

-- Customers without orders

SELECT customer_name
FROM customers
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM orders
);