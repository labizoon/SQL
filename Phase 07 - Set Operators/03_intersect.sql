/*
==========================================
SQL SET OPERATORS - INTERSECT
==========================================

Description:
INTERSECT returns only the rows that are common
to both SELECT statements.

Rules:
1. Both SELECT statements must return the same number of columns.
2. Corresponding columns must have compatible data types.
3. Duplicate rows are removed automatically.
4. Supported in PostgreSQL, SQL Server, and Oracle.
5. MySQL does NOT support INTERSECT directly.
*/

-- ==========================================
-- Example 1
-- Employees with salary greater than 60,000
-- AND belonging to Department 1
-- ==========================================

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE salary > 60000

INTERSECT

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE department_id = 1;


-- ==========================================
-- Example 2
-- Employees hired after 2023
-- AND currently Active
-- ==========================================

SELECT employee_id,
       first_name,
       status
FROM employees
WHERE hire_date >= '2024-01-01'

INTERSECT

SELECT employee_id,
       first_name,
       status
FROM employees
WHERE status = 'Active';


-- ==========================================
-- Example 3
-- Employees who are Managers
-- ==========================================

SELECT employee_id
FROM employees

INTERSECT

SELECT manager_id
FROM employees
WHERE manager_id IS NOT NULL;


-- ==========================================
-- Example 4
-- Departments having employees
-- with salary above 70,000
-- AND employees hired after 2024
-- ==========================================

SELECT department_id
FROM employees
WHERE salary > 70000

INTERSECT

SELECT department_id
FROM employees
WHERE hire_date >= '2024-01-01';


-- ==========================================
-- Example 5
-- Names appearing in both result sets
-- ==========================================

SELECT first_name
FROM employees
WHERE department_id = 1

INTERSECT

SELECT first_name
FROM employees
WHERE salary > 50000;


-- Note:
-- INTERSECT is supported in PostgreSQL, SQL Server, and Oracle.
-- MySQL users can achieve the same result using INNER JOIN or EXISTS.