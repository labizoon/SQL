/*
=========================================================
SQL COMMON TABLE EXPRESSIONS (CTEs)
MULTIPLE CTEs
=========================================================

Description:
You can define multiple CTEs in a single query by
separating them with commas.

Each CTE can reference a previous CTE, making
complex queries easier to read and maintain.

Syntax:

WITH cte1 AS
(
    ...
),
cte2 AS
(
    SELECT ...
    FROM cte1
),
cte3 AS
(
    SELECT ...
    FROM cte2
)
SELECT *
FROM cte3;

Key Points:
1. Multiple CTEs are separated by commas.
2. A CTE can reference only CTEs defined before it.
3. The final query can use one or more CTEs.
*/


-- =====================================================
-- Example 1
-- Department Average Salary
-- and Employees Above Department Average
-- =====================================================

WITH department_average AS
(
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
),

high_salary_employees AS
(
    SELECT
        e.employee_id,
        e.first_name,
        e.department_id,
        e.salary
    FROM employees e
    JOIN department_average d
        ON e.department_id = d.department_id
    WHERE e.salary > d.average_salary
)

SELECT *
FROM high_salary_employees;


-- =====================================================
-- Example 2
-- Active Employees and High Earners
-- =====================================================

WITH active_employees AS
(
    SELECT
        employee_id,
        first_name,
        salary
    FROM employees
    WHERE status = 'Active'
),

high_earners AS
(
    SELECT
        employee_id,
        first_name,
        salary
    FROM active_employees
    WHERE salary > 70000
)

SELECT *
FROM high_earners;


-- =====================================================
-- Example 3
-- Department Employee Count
-- and Large Departments
-- =====================================================

WITH employee_count AS
(
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department_id
),

large_departments AS
(
    SELECT *
    FROM employee_count
    WHERE total_employees >= 5
)

SELECT *
FROM large_departments;


-- =====================================================
-- Example 4
-- Recent Employees
-- and Salary Ranking
-- =====================================================

WITH recent_employees AS
(
    SELECT
        employee_id,
        first_name,
        salary,
        hire_date
    FROM employees
    WHERE hire_date >= '2024-01-01'
),

salary_rank AS
(
    SELECT
        employee_id,
        first_name,
        salary,
        RANK() OVER (
            ORDER BY salary DESC
        ) AS salary_rank
    FROM recent_employees
)

SELECT *
FROM salary_rank;


-- =====================================================
-- Example 5
-- Department Salary
-- and Company Average Comparison
-- =====================================================

WITH company_average AS
(
    SELECT AVG(salary) AS average_salary
    FROM employees
),

department_average AS
(
    SELECT
        department_id,
        AVG(salary) AS department_average
    FROM employees
    GROUP BY department_id
)

SELECT
    d.department_id,
    d.department_average,
    c.average_salary AS company_average
FROM department_average d
CROSS JOIN company_average c;


-- =====================================================
-- Example 6
-- Top 3 Employees Per Department
-- =====================================================

WITH ranked_employees AS
(
    SELECT
        employee_id,
        first_name,
        department_id,
        salary,
        ROW_NUMBER() OVER
        (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rn
    FROM employees
),

top_employees AS
(
    SELECT *
    FROM ranked_employees
    WHERE rn <= 3
)

SELECT *
FROM top_employees;


-- =====================================================
-- Example 7
-- Employee Salary Classification
-- =====================================================

WITH employee_salary AS
(
    SELECT
        employee_id,
        first_name,
        salary
    FROM employees
),

salary_category AS
(
    SELECT
        employee_id,
        first_name,
        salary,
        CASE
            WHEN salary >= 80000 THEN 'High'
            WHEN salary >= 50000 THEN 'Medium'
            ELSE 'Low'
        END AS salary_level
    FROM employee_salary
)

SELECT *
FROM salary_category;


-- =====================================================
-- Example 8
-- Employees and Department Names
-- =====================================================

WITH department_info AS
(
    SELECT
        department_id,
        department_name
    FROM departments
),

employee_department AS
(
    SELECT
        e.employee_id,
        e.first_name,
        d.department_name
    FROM employees e
    JOIN department_info d
        ON e.department_id = d.department_id
)

SELECT *
FROM employee_department;