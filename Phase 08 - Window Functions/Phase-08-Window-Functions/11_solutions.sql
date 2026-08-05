/*
=========================================================
SQL WINDOW FUNCTIONS - SOLUTIONS
=========================================================
*/


-- =====================================================
-- Solution 1
-- ROW_NUMBER() by Salary
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
-- Solution 2
-- ROW_NUMBER() Within Each Department
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


-- =====================================================
-- Solution 3
-- RANK() by Salary
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- =====================================================
-- Solution 4
-- RANK() Within Each Department
-- =====================================================

SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


-- =====================================================
-- Solution 5
-- DENSE_RANK() by Salary
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
-- Solution 6
-- Top 3 Salary Ranks
-- =====================================================

SELECT *
FROM (
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
-- Solution 7
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
-- Solution 8
-- Divide Customers into 5 Spending Groups
-- =====================================================

SELECT
    customer_id,
    customer_name,
    total_spent,
    NTILE(5) OVER (
        ORDER BY total_spent DESC
    ) AS spending_group
FROM customers;


-- =====================================================
-- Solution 9
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
-- Solution 10
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
-- Solution 11
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
-- Solution 12
-- Lowest Salary
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
-- Solution 13
-- Highest Salary
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
-- Solution 14
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
-- Solution 15
-- Running Total of Salaries
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
-- Solution 16
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
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS department_running_total
FROM employees;


-- =====================================================
-- Solution 17
-- 3-Row Moving Average
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    AVG(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS moving_average
FROM employees;


-- =====================================================
-- Solution 18
-- 5-Day Moving Average
-- =====================================================

SELECT
    sale_date,
    sales_amount,
    AVG(sales_amount) OVER (
        ORDER BY sale_date
        ROWS BETWEEN 4 PRECEDING
        AND CURRENT ROW
    ) AS moving_average_sales
FROM sales;


-- =====================================================
-- Solution 19
-- Highest-Paid Employee in Each Department
-- =====================================================

SELECT *
FROM (
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
-- Solution 20
-- Salary Rank + Previous Salary + Running Total
-- =====================================================

SELECT
    employee_id,
    first_name,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank,
    LAG(salary) OVER (
        ORDER BY salary
    ) AS previous_salary,
    SUM(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total
FROM employees;