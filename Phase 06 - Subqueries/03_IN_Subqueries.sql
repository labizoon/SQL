-- =====================================
-- IN SUBQUERY
-- =====================================

-- Employees from departments in New York

SELECT first_name, last_name
FROM employees
WHERE department_id IN
(
    SELECT department_id
    FROM departments
    WHERE location = 'New York'
);

------------------------------------------------

-- Products never ordered

SELECT product_name
FROM products
WHERE product_id NOT IN
(
    SELECT product_id
    FROM order_items
);

------------------------------------------------

-- Customers from cities having premium members

SELECT customer_name
FROM customers
WHERE city IN
(
    SELECT city
    FROM customers
    WHERE membership = 'Premium'
);