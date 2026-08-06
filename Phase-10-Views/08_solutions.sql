/*
=========================================================
SQL VIEWS
SOLUTIONS
=========================================================
*/


-- =====================================================
-- Solution 1
-- Employee Details View
-- =====================================================

CREATE VIEW employee_details AS
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees;


-- =====================================================
-- Solution 2
-- High Salary Employees
-- =====================================================

CREATE VIEW high_salary_employees AS
SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE salary > 60000;


-- =====================================================
-- Solution 3
-- Active Employees
-- =====================================================

CREATE VIEW active_employees AS
SELECT
    employee_id,
    first_name,
    status
FROM employees
WHERE status = 'Active';


-- =====================================================
-- Solution 4
-- Department 2 Employees
-- =====================================================

CREATE VIEW department_2_employees AS
SELECT
    employee_id,
    first_name,
    department_id
FROM employees
WHERE department_id = 2;


-- =====================================================
-- Solution 5
-- Employees Hired After 2023
-- =====================================================

CREATE VIEW recent_employees AS
SELECT
    employee_id,
    first_name,
    hire_date
FROM employees
WHERE hire_date >= '2023-01-01';


-- =====================================================
-- Solution 6
-- Employee and Department Names
-- =====================================================

CREATE VIEW employee_department AS
SELECT
    e.employee_id,
    e.first_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;


-- =====================================================
-- Solution 7
-- Employee, Department and Salary
-- =====================================================

CREATE VIEW employee_department_salary AS
SELECT
    e.employee_id,
    e.first_name,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;


-- =====================================================
-- Solution 8
-- Average Salary by Department
-- =====================================================

CREATE VIEW department_average_salary AS
SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;


-- =====================================================
-- Solution 9
-- Department Summary
-- =====================================================

CREATE VIEW department_summary AS
SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS average_salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name;


-- =====================================================
-- Solution 10
-- Employee Full Name and Annual Salary
-- =====================================================

CREATE VIEW employee_salary_report AS
SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    salary * 12 AS annual_salary
FROM employees;


-- =====================================================
-- Solution 11
-- Update Employee View
-- =====================================================

CREATE OR REPLACE VIEW employee_details AS
SELECT
    employee_id,
    first_name,
    last_name,
    department_id,
    salary
FROM employees;


-- =====================================================
-- Solution 12
-- High Salary View
-- =====================================================

CREATE OR REPLACE VIEW employee_details AS
SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE salary > 70000;


-- =====================================================
-- Solution 13
-- Drop View
-- =====================================================

DROP VIEW employee_details;


-- =====================================================
-- Solution 14
-- Drop View Safely
-- =====================================================

DROP VIEW IF EXISTS employee_details;


-- =====================================================
-- Solution 15
-- Which Object Stores Data?
-- =====================================================

/*
Answer:

b) Table

Tables permanently store data.
Views only store the SQL query.
*/


-- =====================================================
-- Solution 16
-- Which Object Reflects Table Changes?
-- =====================================================

/*
Answer:

a) View

Views always retrieve the latest data
from the underlying table.
*/


-- =====================================================
-- Challenge Solution 1
-- Top 5 Highest Paid Employees
-- =====================================================

CREATE VIEW top_5_highest_paid AS
SELECT
    employee_id,
    first_name,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 5;


-- =====================================================
-- Challenge Solution 2
-- Employees Above Company Average
-- =====================================================

CREATE VIEW above_average_salary AS
SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);


-- =====================================================
-- Challenge Solution 3
-- Department Salary Statistics
-- =====================================================

CREATE VIEW department_salary_statistics AS
SELECT
    d.department_name,
    MAX(e.salary) AS highest_salary,
    MIN(e.salary) AS lowest_salary,
    AVG(e.salary) AS average_salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name;


-- =====================================================
-- Challenge Solution 4
-- Secure Employee View
-- =====================================================

CREATE VIEW employee_public_information AS
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM employees;


-- =====================================================
-- Challenge Solution 5
-- Employee Reporting View
-- =====================================================

CREATE VIEW employee_reporting AS
SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    e.salary,
    CASE
        WHEN e.salary >= 80000 THEN 'High'
        WHEN e.salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;