/*
=========================================================
SQL COMMON TABLE EXPRESSIONS (CTEs)
BASIC CTE
=========================================================

Description:
A Common Table Expression (CTE) is a temporary
named result set that exists only during the
execution of a single SQL statement.

CTEs improve query readability and help simplify
complex queries.

Syntax:

WITH cte_name AS
(
    SELECT ...
)
SELECT *
FROM cte_name;

Key Points:
1. A CTE exists only for the current query.
2. It is not stored permanently in the database.
3. A CTE can be referenced multiple times within
   the same query.
4. CTEs make complex SQL queries easier to read.
*/


-- =====================================================
-- Example 1
-- Employees Earning Above Average Salary
-- =====================================================

WITH high_salary_employees AS
(
    SELECT
        employee_id,
        first_name,
        salary
    FROM employees
    WHERE salary >
    (
        SELECT AVG(salary)
        FROM employees
    )
)

SELECT *
FROM high_salary_employees;


-- =====================================================
-- Example 2
-- Employees in Department 1
-- =====================================================

WITH department_employees AS
(
    SELECT
        employee_id,
        first_name,
        department_id
    FROM employees
    WHERE department_id = 1
)

SELECT *
FROM department_employees;


-- =====================================================
-- Example 3
-- Active Employees
-- =====================================================

WITH active_employees AS
(
    SELECT
        employee_id,
        first_name,
        status
    FROM employees
    WHERE status = 'Active'
)

SELECT *
FROM active_employees;


-- =====================================================
-- Example 4
-- Average Salary by Department
-- =====================================================

WITH department_salary AS
(
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)

SELECT *
FROM department_salary;


-- =====================================================
-- Example 5
-- Employees Hired After 2023
-- =====================================================

WITH recent_employees AS
(
    SELECT
        employee_id,
        first_name,
        hire_date
    FROM employees
    WHERE hire_date >= '2024-01-01'
)

SELECT *
FROM recent_employees;


-- =====================================================
-- Example 6
-- Top 5 Highest Paid Employees
-- =====================================================

WITH ranked_employees AS
(
    SELECT
        employee_id,
        first_name,
        salary,
        ROW_NUMBER() OVER (
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)

SELECT
    employee_id,
    first_name,
    salary
FROM ranked_employees
WHERE rn <= 5;


-- =====================================================
-- Example 7
-- Employees with Salary Greater Than 60,000
-- =====================================================

WITH salary_filter AS
(
    SELECT
        employee_id,
        first_name,
        salary
    FROM employees
    WHERE salary > 60000
)

SELECT *
FROM salary_filter;


-- =====================================================
-- Example 8
-- Count Employees in Each Department
-- =====================================================

WITH department_count AS
(
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department_id
)

SELECT *
FROM department_count;