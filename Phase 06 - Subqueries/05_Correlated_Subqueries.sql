-- =====================================
-- CORRELATED SUBQUERIES
-- =====================================

-- Employees earning above department average

SELECT employee_name,
       salary,
       department_id
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

------------------------------------------------

-- Highest-paid employee in each department

SELECT employee_name,
       salary,
       department_id
FROM employees e
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
);