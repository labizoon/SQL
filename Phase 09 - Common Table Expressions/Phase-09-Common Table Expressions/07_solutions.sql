/*
=========================================================
SQL COMMON TABLE EXPRESSIONS (CTEs)
SOLUTIONS
=========================================================
*/


-- =====================================================
-- Solution 1
-- Employees Earning Above Average Salary
-- =====================================================

WITH average_salary AS
(
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE salary >
(
    SELECT avg_salary
    FROM average_salary
);


-- =====================================================
-- Solution 2
-- Employees Hired After 2023
-- =====================================================

WITH recent_employees AS
(
    SELECT
        employee_id,
        first_name,
        hire_date
    FROM employees
    WHERE hire_date >= '2023-01-01'
)
SELECT *
FROM recent_employees;


-- =====================================================
-- Solution 3
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
-- Solution 4
-- Average Salary by Department
-- =====================================================

WITH department_average AS
(
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM department_average;


-- =====================================================
-- Solution 5
-- Departments Having Average Salary > 60000
-- =====================================================

WITH department_average AS
(
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM department_average
WHERE average_salary > 60000;


-- =====================================================
-- Solution 6
-- Employees Above Department Average
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
-- Solution 7
-- Rank Recent Employees by Salary
-- =====================================================

WITH recent_employees AS
(
    SELECT
        employee_id,
        first_name,
        salary
    FROM employees
    WHERE hire_date >= '2023-01-01'
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
-- Solution 8
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
-- Solution 9
-- Top 3 Salary Ranks
-- =====================================================

WITH ranked_employees AS
(
    SELECT
        employee_id,
        first_name,
        salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE salary_rank <= 3;


-- =====================================================
-- Solution 10
-- Employee and Department Name
-- =====================================================

WITH employee_department AS
(
    SELECT
        e.employee_id,
        e.first_name,
        d.department_name
    FROM employees e
    JOIN departments d
      ON e.department_id = d.department_id
)
SELECT *
FROM employee_department;


-- =====================================================
-- Solution 11
-- Employees Working in New York
-- =====================================================

WITH new_york_departments AS
(
    SELECT
        d.department_id
    FROM departments d
    JOIN locations l
      ON d.location_id = l.location_id
    WHERE l.city = 'New York'
)
SELECT
    employee_id,
    first_name,
    department_id
FROM employees
WHERE department_id IN
(
    SELECT department_id
    FROM new_york_departments
);


-- =====================================================
-- Solution 12
-- Generate Numbers 1 to 20
-- =====================================================

WITH RECURSIVE numbers AS
(
    SELECT 1 AS number

    UNION ALL

    SELECT number + 1
    FROM numbers
    WHERE number < 20
)
SELECT *
FROM numbers;


-- =====================================================
-- Solution 13
-- Generate Dates
-- =====================================================

WITH RECURSIVE calendar AS
(
    SELECT DATE('2025-01-01') AS calendar_date

    UNION ALL

    SELECT calendar_date + INTERVAL 1 DAY
    FROM calendar
    WHERE calendar_date < '2025-01-15'
)
SELECT *
FROM calendar;


-- =====================================================
-- Solution 14
-- Employee Hierarchy
-- =====================================================

WITH RECURSIVE employee_hierarchy AS
(
    SELECT
        employee_id,
        first_name,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.first_name,
        e.manager_id,
        eh.level + 1
    FROM employees e
    JOIN employee_hierarchy eh
      ON e.manager_id = eh.employee_id
)
SELECT *
FROM employee_hierarchy;


-- =====================================================
-- Solution 15
-- Top 3 Employees Per Department
-- =====================================================

WITH ranked_employees AS
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
)
SELECT *
FROM ranked_employees
WHERE rn <= 3;


-- =====================================================
-- Solution 16
-- Departments with More Than 5 Employees
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
FROM department_count
WHERE total_employees > 5;


-- =====================================================
-- Solution 17
-- Employees Above Company Average Salary
-- =====================================================

WITH company_average AS
(
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE salary >
(
    SELECT avg_salary
    FROM company_average
);


-- =====================================================
-- Solution 18
-- Employees with Company Average Salary
-- =====================================================

WITH company_average AS
(
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    c.avg_salary
FROM employees e
CROSS JOIN company_average c;