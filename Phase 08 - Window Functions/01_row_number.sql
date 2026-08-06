/*
=========================================================
SQL WINDOW FUNCTIONS - ROW_NUMBER()
=========================================================

Description:
ROW_NUMBER() assigns a unique sequential number
to each row within a result set.

Syntax:

ROW_NUMBER() OVER (
    [PARTITION BY column_name]
    ORDER BY column_name
)

Key Points:
1. Every row receives a unique number.
2. Numbering starts from 1.
3. ORDER BY is mandatory.
4. PARTITION BY is optional.
*/

-- =====================================================
-- Example 1
-- Assign Row Numbers by Salary
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_num
FROM employees;


-- =====================================================
-- Example 2
-- Row Number Within Each Department
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


-- =====================================================
-- Example 3
-- Employees Ordered by Hire Date
-- =====================================================

SELECT
    employee_id,
    first_name,
    hire_date,
    ROW_NUMBER() OVER (
        ORDER BY hire_date
    ) AS hire_order
FROM employees;


-- =====================================================
-- Example 4
-- Highest Paid Employee in Each Department
-- =====================================================

SELECT *
FROM
(
    SELECT
        employee_id,
        first_name,
        department_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees
) ranked_employees
WHERE rn = 1;


-- =====================================================
-- Example 5
-- Top 3 Highest Paid Employees
-- =====================================================

SELECT *
FROM
(
    SELECT
        employee_id,
        first_name,
        salary,
        ROW_NUMBER() OVER (
            ORDER BY salary DESC
        ) AS rn
    FROM employees
) ranked_employees
WHERE rn <= 3;


-- =====================================================
-- Example 6
-- Latest Employees
-- =====================================================

SELECT
    employee_id,
    first_name,
    hire_date,
    ROW_NUMBER() OVER (
        ORDER BY hire_date DESC
    ) AS latest_employee
FROM employees;


-- =====================================================
-- Example 7
-- Row Number by Department and Hire Date
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    hire_date,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY hire_date
    ) AS joining_order
FROM employees;