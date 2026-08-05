/*
==========================================
SQL SET OPERATORS - UNION ALL
==========================================

Description:
UNION ALL combines the results of two or more
SELECT statements without removing duplicate rows.

Rules:
1. Both SELECT statements must return the same number of columns.
2. Corresponding columns must have compatible data types.
3. Duplicate rows are retained.
4. UNION ALL is generally faster than UNION because it does not perform duplicate elimination.
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

UNION ALL

SELECT employee_id,
       first_name,
       department_id
FROM employees
WHERE department_id = 2;


-- ==========================================
-- Example 2
-- High Salary Employees and Recently Hired Employees
-- Duplicate employees (if any) will appear twice.
-- ==========================================

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE salary >= 70000

UNION ALL

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE hire_date >= '2024-01-01';


-- ==========================================
-- Example 3
-- Employees and Managers
-- Duplicate manager IDs are kept.
-- ==========================================

SELECT employee_id AS id,
       first_name AS name
FROM employees

UNION ALL

SELECT manager_id,
       first_name
FROM employees
WHERE manager_id IS NOT NULL;


-- ==========================================
-- Example 4
-- UNION ALL with ORDER BY
-- ORDER BY is written only once,
-- after the final SELECT statement.
-- ==========================================

SELECT first_name,
       salary
FROM employees
WHERE department_id = 1

UNION ALL

SELECT first_name,
       salary
FROM employees
WHERE department_id = 2

ORDER BY salary DESC;


-- ==========================================
-- Example 5
-- Demonstrating Duplicate Rows
-- Employees earning more than 60,000 OR
-- belonging to Department 1.
-- If an employee satisfies both conditions,
-- they will appear twice.
-- ==========================================

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE salary > 60000

UNION ALL

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE department_id = 1;