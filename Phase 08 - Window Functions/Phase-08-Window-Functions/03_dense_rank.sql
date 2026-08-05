/*
=========================================================
SQL WINDOW FUNCTIONS - DENSE_RANK()
=========================================================

Description:
DENSE_RANK() assigns a rank to each row based on
the specified ORDER BY clause.

Rows with the same value receive the same rank,
but unlike RANK(), the next rank is NOT skipped.

Example:
Scores: 95, 90, 90, 85

RANK():
95 → 1
90 → 2
90 → 2
85 → 4

DENSE_RANK():
95 → 1
90 → 2
90 → 2
85 → 3

Syntax:

DENSE_RANK() OVER (
    [PARTITION BY column_name]
    ORDER BY column_name
)

Key Points:
1. Duplicate values receive the same rank.
2. No gaps in ranking.
3. ORDER BY is mandatory.
4. PARTITION BY is optional.
*/


-- =====================================================
-- Example 1
-- Dense Rank Employees by Salary
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- =====================================================
-- Example 2
-- Dense Rank Employees Within Each Department
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


-- =====================================================
-- Example 3
-- Dense Rank Employees by Hire Date
-- =====================================================

SELECT
    employee_id,
    first_name,
    hire_date,
    DENSE_RANK() OVER (
        ORDER BY hire_date
    ) AS hire_rank
FROM employees;


-- =====================================================
-- Example 4
-- Top 3 Salary Ranks
-- (Includes ties without skipped ranks)
-- =====================================================

SELECT *
FROM
(
    SELECT
        employee_id,
        first_name,
        salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
) ranked_employees
WHERE salary_rank <= 3;


-- =====================================================
-- Example 5
-- Highest Paid Employee(s) in Each Department
-- =====================================================

SELECT *
FROM
(
    SELECT
        employee_id,
        first_name,
        department_id,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS department_rank
    FROM employees
) ranked_employees
WHERE department_rank = 1;


-- =====================================================
-- Example 6
-- Dense Rank Departments by Average Salary
-- =====================================================

SELECT
    department_id,
    AVG(salary) AS average_salary,
    DENSE_RANK() OVER (
        ORDER BY AVG(salary) DESC
    ) AS department_salary_rank
FROM employees
GROUP BY department_id;


-- =====================================================
-- Example 7
-- Dense Rank Employees by Hire Date
-- Within Each Department
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    hire_date,
    DENSE_RANK() OVER (
        PARTITION BY department_id
        ORDER BY hire_date
    ) AS joining_rank
FROM employees;