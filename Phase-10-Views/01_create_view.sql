/*
=========================================================
SQL VIEWS
CREATING VIEWS
=========================================================

Description:
A View is a virtual table based on the result of
a SQL query. Unlike a table, a view does not
store data itself (except materialized views in
some database systems).

Views help simplify complex queries, improve
security, and promote code reusability.

Syntax:

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
*/


/*
=========================================================
Example 1
Create a Simple View
=========================================================
*/

CREATE VIEW employee_details AS
SELECT
    employee_id,
    first_name,
    last_name,
    department_id,
    salary
FROM employees;


/*
=========================================================
Retrieve Data from the View
=========================================================
*/

SELECT *
FROM employee_details;


/*
=========================================================
Example 2
Employees with Salary Above 60000
=========================================================
*/

CREATE VIEW high_salary_employees AS
SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE salary > 60000;

SELECT *
FROM high_salary_employees;


/*
=========================================================
Example 3
Employees in Department 1
=========================================================
*/

CREATE VIEW department_1_employees AS
SELECT
    employee_id,
    first_name,
    department_id
FROM employees
WHERE department_id = 1;

SELECT *
FROM department_1_employees;


/*
=========================================================
Example 4
Active Employees
=========================================================
*/

CREATE VIEW active_employees AS
SELECT
    employee_id,
    first_name,
    status
FROM employees
WHERE status = 'Active';

SELECT *
FROM active_employees;


/*
=========================================================
Example 5
Department Information
=========================================================
*/

CREATE VIEW department_information AS
SELECT
    department_id,
    department_name
FROM departments;

SELECT *
FROM department_information;


/*
=========================================================
Example 6
Employee and Department Details
=========================================================
*/

CREATE VIEW employee_department AS
SELECT
    e.employee_id,
    e.first_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;

SELECT *
FROM employee_department;


/*
=========================================================
Example 7
Average Salary by Department
=========================================================
*/

CREATE VIEW department_salary_summary AS
SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

SELECT *
FROM department_salary_summary;


/*
=========================================================
Example 8
Top 5 Highest Paid Employees
=========================================================
*/

CREATE VIEW top_5_highest_paid AS
SELECT
    employee_id,
    first_name,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

SELECT *
FROM top_5_highest_paid;


/*
=========================================================
Advantages of Views
=========================================================

✔ Simplify complex queries

✔ Hide unnecessary columns

✔ Improve security

✔ Reuse SQL logic

✔ Easier reporting

✔ Consistent query structure
*/


/*
=========================================================
Common Use Cases
=========================================================

✔ Employee reports

✔ Sales dashboards

✔ Financial summaries

✔ Department reports

✔ Customer summaries

✔ Analytics and BI reporting
*/