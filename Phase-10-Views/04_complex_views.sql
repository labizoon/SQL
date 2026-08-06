/*
=========================================================
SQL VIEWS
COMPLEX VIEWS
=========================================================

Description:
Complex views combine data from multiple tables
or use aggregate functions to simplify reporting.

Complex views commonly include:

• JOIN
• GROUP BY
• Aggregate Functions
• Multiple Tables
• Calculated Columns

These views are mainly used for reporting,
dashboards, and business analytics.
*/


/*
=========================================================
Example 1
Employee and Department Details
=========================================================
*/

CREATE VIEW employee_department_details AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;

SELECT *
FROM employee_department_details;



/*
=========================================================
Example 2
Department Salary Summary
=========================================================
*/

CREATE VIEW department_salary_summary AS
SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary,
    MIN(e.salary) AS lowest_salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name;

SELECT *
FROM department_salary_summary;



/*
=========================================================
Example 3
Employees Above Department Average Salary
=========================================================
*/

CREATE VIEW above_department_average AS
SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    e.department_id
FROM employees e
JOIN
(
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
) d
ON e.department_id = d.department_id
WHERE e.salary > d.average_salary;

SELECT *
FROM above_department_average;



/*
=========================================================
Example 4
Employee Full Name
=========================================================
*/

CREATE VIEW employee_full_name AS
SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary
FROM employees;

SELECT *
FROM employee_full_name;



/*
=========================================================
Example 5
Department Employee Count
=========================================================
*/

CREATE VIEW department_employee_count AS
SELECT
    department_id,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department_id;

SELECT *
FROM department_employee_count;



/*
=========================================================
Example 6
High Salary Employees
=========================================================
*/

CREATE VIEW high_salary_employees AS
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

SELECT *
FROM high_salary_employees;



/*
=========================================================
Example 7
Employee Salary Category
=========================================================
*/

CREATE VIEW employee_salary_category AS
SELECT
    employee_id,
    first_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;

SELECT *
FROM employee_salary_category;



/*
=========================================================
Example 8
Employee Hiring Report
=========================================================
*/

CREATE VIEW employee_hiring_report AS
SELECT
    employee_id,
    first_name,
    hire_date,
    YEAR(hire_date) AS hiring_year
FROM employees;

SELECT *
FROM employee_hiring_report;



/*
=========================================================
Characteristics of Complex Views
=========================================================

✔ Multiple tables

✔ JOIN operations

✔ Aggregate functions

✔ GROUP BY

✔ Calculated columns

✔ CASE expressions

✔ Subqueries
*/



/*
=========================================================
Common Real-World Uses
=========================================================

✔ HR Reports

✔ Payroll Reports

✔ Sales Dashboards

✔ Financial Reports

✔ Executive Dashboards

✔ Customer Analytics

✔ Business Intelligence
*/



/*
=========================================================
Limitations
=========================================================

Most complex views are NOT updatable because
they contain:

✖ GROUP BY

✖ Aggregate Functions

✖ Multiple-table joins

✖ Subqueries

✖ DISTINCT

✖ UNION

These views are generally used for reporting
rather than data modification.
*/