-- =====================================
-- SUBQUERY IN FROM
-- =====================================

-- Average department salary

SELECT department_id,
       avg_salary
FROM
(
    SELECT department_id,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS department_average;

------------------------------------------------

-- Customers with total spending

SELECT customer_id,
       total_spent
FROM
(
    SELECT customer_id,
           SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
) AS spending;