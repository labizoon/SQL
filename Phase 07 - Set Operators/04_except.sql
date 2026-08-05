/*
==========================================
SQL SET OPERATORS - EXCEPT
==========================================

Description:
EXCEPT returns the rows from the first SELECT
statement that do NOT exist in the second
SELECT statement.

Rules:
1. Both SELECT statements must return the same number of columns.
2. Corresponding columns must have compatible data types.
3. Duplicate rows are removed automatically.
4. EXCEPT is supported in PostgreSQL and SQL Server.
5. Oracle uses MINUS instead of EXCEPT.
6. MySQL does NOT support EXCEPT directly.
*/

-- ==========================================
-- Example 1
-- Employees in Department 1
-- but not in Department 2
-- ==========================================

SELECT employee_id,
       first_name,
       department_id
FROM employees
WHERE department_id = 1

EXCEPT

SELECT employee_id,
       first_name,
       department_id
FROM employees
WHERE department_id = 2;


-- ==========================================
-- Example 2
-- Employees earning more than 60,000
-- but not hired after 2024
-- ==========================================

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE salary > 60000

EXCEPT

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE hire_date >= '2024-01-01';


-- ==========================================
-- Example 3
-- Employees who are NOT managers
-- ==========================================

SELECT employee_id
FROM employees

EXCEPT

SELECT manager_id
FROM employees
WHERE manager_id IS NOT NULL;


-- ==========================================
-- Example 4
-- Departments without employees
-- hired after 2024
-- ==========================================

SELECT department_id
FROM employees

EXCEPT

SELECT department_id
FROM employees
WHERE hire_date >= '2024-01-01';


-- ==========================================
-- Example 5
-- Employee names in Department 1
-- but not earning above 50,000
-- ==========================================

SELECT first_name
FROM employees
WHERE department_id = 1

EXCEPT

SELECT first_name
FROM employees
WHERE salary > 50000;


/*
==========================================
MySQL Alternative
==========================================

MySQL does not support EXCEPT.

You can achieve similar results using:
- NOT EXISTS
- NOT IN
- LEFT JOIN ... IS NULL
*/