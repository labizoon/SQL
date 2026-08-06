/*
=========================================================
SQL WINDOW FUNCTIONS
FIRST_VALUE(), LAST_VALUE() & NTH_VALUE()
=========================================================

Description:
These window functions return values from specific
positions within a window.

FIRST_VALUE() : Returns the first value.
LAST_VALUE()  : Returns the last value.
NTH_VALUE()   : Returns the nth value.

Syntax:

FIRST_VALUE(column_name)
OVER (
    [PARTITION BY column_name]
    ORDER BY column_name
)

LAST_VALUE(column_name)
OVER (
    [PARTITION BY column_name]
    ORDER BY column_name
    ROWS BETWEEN UNBOUNDED PRECEDING
    AND UNBOUNDED FOLLOWING
)

NTH_VALUE(column_name, n)
OVER (
    [PARTITION BY column_name]
    ORDER BY column_name
    ROWS BETWEEN UNBOUNDED PRECEDING
    AND UNBOUNDED FOLLOWING
)

Key Points:
1. ORDER BY is required.
2. PARTITION BY is optional.
3. LAST_VALUE() often requires an explicit window frame.
4. NTH_VALUE() returns NULL if the nth row does not exist.
*/


-- =====================================================
-- Example 1
-- Lowest Salary in the Company
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    FIRST_VALUE(salary) OVER (
        ORDER BY salary
    ) AS lowest_salary
FROM employees;


-- =====================================================
-- Example 2
-- Highest Salary in the Company
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    LAST_VALUE(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS highest_salary
FROM employees;


-- =====================================================
-- Example 3
-- Second Highest Salary
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    NTH_VALUE(salary, 2) OVER (
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS second_highest_salary
FROM employees;


-- =====================================================
-- Example 4
-- First Salary Within Each Department
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    FIRST_VALUE(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary
    ) AS department_lowest_salary
FROM employees;


-- =====================================================
-- Example 5
-- Highest Salary Within Each Department
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LAST_VALUE(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS department_highest_salary
FROM employees;


-- =====================================================
-- Example 6
-- Third Highest Salary in Each Department
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    NTH_VALUE(salary, 3) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS third_highest_salary
FROM employees;


-- =====================================================
-- Example 7
-- Earliest Hire Date
-- =====================================================

SELECT
    employee_id,
    first_name,
    hire_date,
    FIRST_VALUE(hire_date) OVER (
        ORDER BY hire_date
    ) AS first_hire_date
FROM employees;


-- =====================================================
-- Example 8
-- Latest Hire Date
-- =====================================================

SELECT
    employee_id,
    first_name,
    hire_date,
    LAST_VALUE(hire_date) OVER (
        ORDER BY hire_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS latest_hire_date
FROM employees;