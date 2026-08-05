/*
==========================================
SQL SET OPERATORS - UNION
==========================================

Description:
UNION combines the results of two or more SELECT
statements and removes duplicate rows.

Rules:
1. Both SELECT statements must return the same number of columns.
2. The corresponding columns must have compatible data types.
3. Duplicate rows are removed automatically.
*/

-- ==========================================
-- Example 1
-- Employees from Department 1 and Department 2
-- ==========================================

SELECT employee_id,
       first_name,
       department_id
FROM employees
WHERE department_id = 1

UNION

SELECT employee_id,
       first_name,
       department_id
FROM employees
WHERE department_id = 2;


-- ==========================================
-- Example 2
-- Employees with High Salary OR Recent Hire
-- ==========================================

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE salary >= 70000

UNION

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE hire_date >= '2024-01-01';


-- ==========================================
-- Example 3
-- Employees and Managers
-- ==========================================

SELECT employee_id AS id,
       first_name AS name
FROM employees

UNION

SELECT manager_id,
       first_name
FROM employees
WHERE manager_id IS NOT NULL;


-- ==========================================
-- Example 4
-- UNION with ORDER BY
-- ORDER BY should appear only once,
-- after the last SELECT statement.
-- ==========================================

SELECT first_name,
       salary
FROM employees
WHERE department_id = 1

UNION

SELECT first_name,
       salary
FROM employees
WHERE department_id = 2

ORDER BY salary DESC;