-- =====================================
-- EXISTS SUBQUERY
-- =====================================

-- Customers with at least one order

SELECT customer_name
FROM customers c
WHERE EXISTS
(
    SELECT *
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

------------------------------------------------

-- Products that have been sold

SELECT product_name
FROM products p
WHERE EXISTS
(
    SELECT *
    FROM order_items oi
    WHERE oi.product_id = p.product_id
);

------------------------------------------------

-- Departments having employees

SELECT department_name
FROM departments d
WHERE EXISTS
(
    SELECT *
    FROM employees e
    WHERE e.department_id = d.department_id
);