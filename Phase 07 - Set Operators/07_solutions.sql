/*
=========================================================
SQL SET OPERATORS - SOLUTIONS
=========================================================
*/


-- ==========================================
-- Solution 1
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
-- Solution 2
-- Employees earning above 70,000
-- OR hired after 2024
-- ==========================================

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE salary > 70000

UNION

SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE hire_date >= '2024-01-01';


-- ==========================================
-- Solution 3
-- Unique Employee IDs and Manager IDs
-- ==========================================

SELECT employee_id AS id
FROM employees

UNION

SELECT manager_id
FROM employees
WHERE manager_id IS NOT NULL;


-- ==========================================
-- Solution 4
-- Employees from Sales and HR Departments
-- ==========================================

SELECT first_name
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Sales'
)

UNION

SELECT first_name
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name = 'HR'
);


-- ==========================================
-- Solution 5
-- Unique Department IDs
-- ==========================================

SELECT department_id
FROM employees

UNION

SELECT department_id
FROM departments;


-- ==========================================
-- Solution 6
-- UNION ALL
-- ==========================================

SELECT employee_id,
       first_name
FROM employees
WHERE department_id = 1

UNION ALL

SELECT employee_id,
       first_name
FROM employees
WHERE department_id = 2;


-- ==========================================
-- Solution 7
-- Salary > 60,000 OR Department 3
-- Keep Duplicates
-- ==========================================

SELECT employee_id,
       first_name
FROM employees
WHERE salary > 60000

UNION ALL

SELECT employee_id,
       first_name
FROM employees
WHERE department_id = 3;


-- ==========================================
-- Solution 8
-- Employee IDs and Manager IDs
-- ==========================================

SELECT employee_id
FROM employees

UNION ALL

SELECT manager_id
FROM employees
WHERE manager_id IS NOT NULL;


-- ==========================================
-- Solution 9
-- Employee and Manager Names
-- ==========================================

SELECT first_name
FROM employees

UNION ALL

SELECT manager_name
FROM managers;


-- ==========================================
-- Solution 10
-- Department IDs with Duplicates
-- ==========================================

SELECT department_id
FROM employees

UNION ALL

SELECT department_id
FROM departments;


-- ==========================================
-- Solution 11
-- Salary > 60,000
-- AND Department 1
-- ==========================================

SELECT employee_id,
       first_name
FROM employees
WHERE salary > 60000

INTERSECT

SELECT employee_id,
       first_name
FROM employees
WHERE department_id = 1;


-- ==========================================
-- Solution 12
-- Active Employees Hired After 2024
-- ==========================================

SELECT employee_id,
       first_name
FROM employees
WHERE hire_date >= '2024-01-01'

INTERSECT

SELECT employee_id,
       first_name
FROM employees
WHERE status = 'Active';


-- ==========================================
-- Solution 13
-- Employees Who Are Managers
-- ==========================================

SELECT employee_id
FROM employees

INTERSECT

SELECT manager_id
FROM employees
WHERE manager_id IS NOT NULL;


-- ==========================================
-- Solution 14
-- Departments Matching Both Conditions
-- ==========================================

SELECT department_id
FROM employees
WHERE salary > 70000

INTERSECT

SELECT department_id
FROM employees
WHERE hire_date >= '2024-01-01';


-- ==========================================
-- Solution 15
-- Common Employee Names
-- ==========================================

SELECT first_name
FROM employees
WHERE department_id = 1

INTERSECT

SELECT first_name
FROM employees
WHERE salary > 50000;


-- ==========================================
-- Solution 16
-- Employees Who Are Not Managers
-- ==========================================

SELECT employee_id
FROM employees

EXCEPT

SELECT manager_id
FROM employees
WHERE manager_id IS NOT NULL;


-- ==========================================
-- Solution 17
-- Salary > 60,000 but not hired after 2024
-- ==========================================

SELECT employee_id,
       first_name
FROM employees
WHERE salary > 60000

EXCEPT

SELECT employee_id,
       first_name
FROM employees
WHERE hire_date >= '2024-01-01';


-- ==========================================
-- Solution 18
-- Department 1 Employees
-- Excluding Department 2 Employees
-- ==========================================

SELECT employee_id,
       first_name
FROM employees
WHERE department_id = 1

EXCEPT

SELECT employee_id,
       first_name
FROM employees
WHERE department_id = 2;


-- ==========================================
-- Solution 19
-- Departments Without Employees
-- Hired After 2024
-- ==========================================

SELECT department_id
FROM employees

EXCEPT

SELECT department_id
FROM employees
WHERE hire_date >= '2024-01-01';


-- ==========================================
-- Solution 20
-- Department 1 Employees
-- Excluding Salary > 50,000
-- ==========================================

SELECT first_name
FROM employees
WHERE department_id = 1

EXCEPT

SELECT first_name
FROM employees
WHERE salary > 50000;