-- ===========================================
-- RIGHT JOIN
-- ===========================================

-- Show all orders even if customer details are missing
SELECT c.customer_name,
       o.order_id,
       o.total_amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- Show all order details even if product information is missing
SELECT p.product_name,
       od.quantity
FROM products p
RIGHT JOIN order_details od
ON p.product_id = od.product_id;