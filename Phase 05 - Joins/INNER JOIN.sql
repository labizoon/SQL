-- ===========================================
-- INNER JOIN
-- ===========================================

-- Display all orders with customer names
SELECT o.order_id,
       c.customer_name,
       o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- Display product names with order details
SELECT od.order_id,
       p.product_name,
       od.quantity
FROM order_details od
INNER JOIN products p
ON od.product_id = p.product_id;

-- Display customer names and their ordered products
SELECT c.customer_name,
       p.product_name,
       od.quantity
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN order_details od
ON o.order_id = od.order_id
INNER JOIN products p
ON od.product_id = p.product_id;

-- Show customer city and order amount
SELECT c.customer_name,
       c.city,
       o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;