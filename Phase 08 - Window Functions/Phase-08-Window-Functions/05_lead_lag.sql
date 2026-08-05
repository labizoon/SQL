/*
=========================================================
SQL WINDOW FUNCTIONS - LEAD() & LAG()
=========================================================

Description:
LAG() returns the value from a previous row,
while LEAD() returns the value from a following row.

These functions are commonly used to compare
current rows with previous or next rows.

Syntax:

LAG(column_name, offset, default_value)
OVER (
    [PARTITION BY column_name]
    ORDER BY column_name
)

LEAD(column_name, offset, default_value)
OVER (
    [PARTITION BY column_name]
    ORDER BY column_name
)

Key Points:
1. ORDER BY is mandatory.
2. PARTITION BY is optional.
3. Offset defaults to 1.
4. Default value is returned when no previous/next row exists.
*/


-- =====================================================
-- Example 1
-- Previous Employee Salary
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    LAG(salary) OVER (
        ORDER BY salary
    ) AS previous_salary
FROM employees;


-- =====================================================
-- Example 2
-- Next Employee Salary
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    LEAD(salary) OVER (
        ORDER BY salary
    ) AS next_salary
FROM employees;


-- =====================================================
-- Example 3
-- Salary Difference from Previous Employee
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    salary -
    LAG(salary) OVER (
        ORDER BY salary
    ) AS salary_difference
FROM employees;


-- =====================================================
-- Example 4
-- Previous Salary Within Each Department
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LAG(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary
    ) AS previous_department_salary
FROM employees;


-- =====================================================
-- Example 5
-- Next Salary Within Each Department
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LEAD(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary
    ) AS next_department_salary
FROM employees;


-- =====================================================
-- Example 6
-- Compare Employee Hire Dates
-- =====================================================

SELECT
    employee_id,
    first_name,
    hire_date,
    LAG(hire_date) OVER (
        ORDER BY hire_date
    ) AS previous_hire_date,
    LEAD(hire_date) OVER (
        ORDER BY hire_date
    ) AS next_hire_date
FROM employees;


-- =====================================================
-- Example 7
-- Previous Month Sales
-- =====================================================

SELECT
    sale_date,
    sales_amount,
    LAG(sales_amount) OVER (
        ORDER BY sale_date
    ) AS previous_month_sales
FROM sales;


-- =====================================================
-- Example 8
-- Month-to-Month Sales Growth
-- =====================================================

SELECT
    sale_date,
    sales_amount,
    sales_amount -
    LAG(sales_amount) OVER (
        ORDER BY sale_date
    ) AS sales_growth
FROM sales;


-- =====================================================
-- Example 9
-- Using Offset = 2
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    LAG(salary, 2) OVER (
        ORDER BY salary
    ) AS salary_two_rows_back
FROM employees;


-- =====================================================
-- Example 10
-- Using Default Value
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    LAG(salary, 1, 0) OVER (
        ORDER BY salary
    ) AS previous_salary
FROM employees;