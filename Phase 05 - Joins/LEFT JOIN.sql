-- ===========================================
-- LEFT JOIN
-- ===========================================

-- Show all customers including those without orders
SELECT c.customer_name,
       o.order_id,
       o.total_amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- Show all products including those never ordered
SELECT p.product_name,
       od.quantity
FROM products p
LEFT JOIN order_details od
ON p.product_id = od.product_id;

-- Customers without orders
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;