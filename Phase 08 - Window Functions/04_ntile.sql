/*
=========================================================
SQL WINDOW FUNCTIONS - NTILE()
=========================================================

Description:
NTILE() divides the result set into a specified
number of approximately equal-sized groups (buckets).

Syntax:

NTILE(number_of_groups) OVER (
    [PARTITION BY column_name]
    ORDER BY column_name
)

Key Points:
1. ORDER BY is mandatory.
2. PARTITION BY is optional.
3. Buckets are numbered starting from 1.
4. If rows cannot be divided equally, the earlier
   buckets receive one extra row.
*/


-- =====================================================
-- Example 1
-- Divide Employees into 4 Salary Groups
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    NTILE(4) OVER (
        ORDER BY salary DESC
    ) AS salary_quartile
FROM employees;


-- =====================================================
-- Example 2
-- Divide Employees into 3 Groups by Hire Date
-- =====================================================

SELECT
    employee_id,
    first_name,
    hire_date,
    NTILE(3) OVER (
        ORDER BY hire_date
    ) AS hire_group
FROM employees;


-- =====================================================
-- Example 3
-- Divide Employees into 5 Performance Groups
-- =====================================================

SELECT
    employee_id,
    first_name,
    performance_score,
    NTILE(5) OVER (
        ORDER BY performance_score DESC
    ) AS performance_group
FROM employees;


-- =====================================================
-- Example 4
-- Salary Quartiles Within Each Department
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    NTILE(4) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_salary_quartile
FROM employees;


-- =====================================================
-- Example 5
-- Divide Employees into Top and Bottom Half
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    NTILE(2) OVER (
        ORDER BY salary DESC
    ) AS salary_half
FROM employees;


-- =====================================================
-- Example 6
-- Monthly Sales Quartiles
-- =====================================================

SELECT
    employee_id,
    sales_amount,
    NTILE(4) OVER (
        ORDER BY sales_amount DESC
    ) AS sales_quartile
FROM sales;


-- =====================================================
-- Example 7
-- Customer Spending Groups
-- =====================================================

SELECT
    customer_id,
    total_spent,
    NTILE(10) OVER (
        ORDER BY total_spent DESC
    ) AS spending_decile
FROM customers;