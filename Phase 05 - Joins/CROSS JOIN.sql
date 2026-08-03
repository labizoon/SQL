-- ===========================================
-- CROSS JOIN
-- ===========================================

-- Every customer with every product
SELECT c.customer_name,
       p.product_name
FROM customers c
CROSS JOIN products p;

-- Every city with every product category
SELECT DISTINCT c.city,
       p.category
FROM customers c
CROSS JOIN products p;