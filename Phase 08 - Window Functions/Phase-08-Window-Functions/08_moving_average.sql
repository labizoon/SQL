/*
=========================================================
SQL WINDOW FUNCTIONS - MOVING AVERAGE
=========================================================

Description:
A moving average (also called a rolling average)
calculates the average value over a specified
window of rows.

Unlike a running average, a moving average only
considers a fixed number of neighboring rows.

Syntax:

AVG(column_name) OVER (
    [PARTITION BY column_name]
    ORDER BY column_name
    ROWS BETWEEN n PRECEDING AND CURRENT ROW
)

Key Points:
1. ORDER BY is required.
2. PARTITION BY is optional.
3. Window frames determine how many rows are included.
4. Frequently used in finance, sales, and trend analysis.
*/


-- =====================================================
-- Example 1
-- 3-Row Moving Average of Employee Salaries
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    AVG(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average_salary
FROM employees;


-- =====================================================
-- Example 2
-- 5-Day Moving Average of Sales
-- =====================================================

SELECT
    sale_date,
    sales_amount,
    AVG(sales_amount) OVER (
        ORDER BY sale_date
        ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ) AS moving_average_sales
FROM sales;


-- =====================================================
-- Example 3
-- Moving Average Within Each Department
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    AVG(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS department_moving_average
FROM employees;


-- =====================================================
-- Example 4
-- 7-Day Moving Average of Revenue
-- =====================================================

SELECT
    sale_date,
    revenue,
    AVG(revenue) OVER (
        ORDER BY sale_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS revenue_moving_average
FROM sales;


-- =====================================================
-- Example 5
-- Customer Purchase Moving Average
-- =====================================================

SELECT
    customer_id,
    order_date,
    order_amount,
    AVG(order_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS customer_moving_average
FROM orders;


-- =====================================================
-- Example 6
-- Moving Average of Product Sales
-- =====================================================

SELECT
    product_id,
    sale_date,
    quantity_sold,
    AVG(quantity_sold) OVER (
        PARTITION BY product_id
        ORDER BY sale_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS product_moving_average
FROM sales;


-- =====================================================
-- Example 7
-- Compare Salary with Moving Average
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    AVG(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average,
    salary -
    AVG(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS difference_from_average
FROM employees;


-- =====================================================
-- Example 8
-- 10-Day Moving Average
-- =====================================================

SELECT
    sale_date,
    sales_amount,
    AVG(sales_amount) OVER (
        ORDER BY sale_date
        ROWS BETWEEN 9 PRECEDING AND CURRENT ROW
    ) AS moving_average_10_days
FROM sales;