/*
=========================================================
SQL WINDOW FUNCTIONS - RUNNING TOTAL
=========================================================

Description:
A running total (also called a cumulative sum)
calculates the cumulative value of a column as
you move through the result set.

Syntax:

SUM(column_name) OVER (
    [PARTITION BY column_name]
    ORDER BY column_name
)

Key Points:
1. ORDER BY is required.
2. PARTITION BY is optional.
3. Running totals are calculated row by row.
4. Commonly used in financial reports, sales,
   inventory, and analytics.
*/


-- =====================================================
-- Example 1
-- Running Total of Employee Salaries
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    SUM(salary) OVER (
        ORDER BY salary
    ) AS running_salary_total
FROM employees;


-- =====================================================
-- Example 2
-- Running Total Within Each Department
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    SUM(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary
    ) AS department_running_total
FROM employees;


-- =====================================================
-- Example 3
-- Running Total of Monthly Sales
-- =====================================================

SELECT
    sale_date,
    sales_amount,
    SUM(sales_amount) OVER (
        ORDER BY sale_date
    ) AS cumulative_sales
FROM sales;


-- =====================================================
-- Example 4
-- Running Total by Customer
-- =====================================================

SELECT
    customer_id,
    order_date,
    order_amount,
    SUM(order_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS customer_running_total
FROM orders;


-- =====================================================
-- Example 5
-- Running Count of Employees
-- =====================================================

SELECT
    employee_id,
    first_name,
    COUNT(*) OVER (
        ORDER BY employee_id
    ) AS running_employee_count
FROM employees;


-- =====================================================
-- Example 6
-- Running Average Salary
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    AVG(salary) OVER (
        ORDER BY salary
    ) AS running_average_salary
FROM employees;


-- =====================================================
-- Example 7
-- Running Total Using Explicit Window Frame
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    SUM(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total
FROM employees;


-- =====================================================
-- Example 8
-- Daily Revenue Running Total
-- =====================================================

SELECT
    sale_date,
    sales_amount,
    SUM(sales_amount) OVER (
        ORDER BY sale_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_revenue
FROM sales;