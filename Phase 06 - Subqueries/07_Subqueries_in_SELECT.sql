-- =====================================
-- SUBQUERY IN SELECT
-- =====================================

SELECT
    customer_name,
    (
        SELECT COUNT(*)
        FROM orders
        WHERE orders.customer_id = customers.customer_id
    ) AS total_orders
FROM customers;

------------------------------------------------

SELECT
    department_name,
    (
        SELECT COUNT(*)
        FROM employees
        WHERE employees.department_id = departments.department_id
    ) AS total_employees
FROM departments;