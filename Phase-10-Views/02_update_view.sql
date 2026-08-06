/*
=========================================================
SQL VIEWS
UPDATING VIEWS
=========================================================

Description:
A view can be modified after it has been created.

In MySQL, you can use either:

1. CREATE OR REPLACE VIEW
2. ALTER VIEW

The most commonly used approach is
CREATE OR REPLACE VIEW.

Note:
Not all views are updatable. Views containing
GROUP BY, DISTINCT, aggregate functions,
UNION, or complex joins are generally
not updatable.
*/


/*
=========================================================
Example 1
Create a View
=========================================================
*/

CREATE VIEW employee_details AS
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees;


/*
=========================================================
View Before Update
=========================================================
*/

SELECT *
FROM employee_details;



/*
=========================================================
Example 2
Modify the View
(Add Department ID)
=========================================================
*/

CREATE OR REPLACE VIEW employee_details AS
SELECT
    employee_id,
    first_name,
    last_name,
    department_id,
    salary
FROM employees;

SELECT *
FROM employee_details;



/*
=========================================================
Example 3
Modify the View
(Filter High Salary Employees)
=========================================================
*/

CREATE OR REPLACE VIEW employee_details AS
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > 60000;

SELECT *
FROM employee_details;



/*
=========================================================
Example 4
Rename Column Using Alias
=========================================================
*/

CREATE OR REPLACE VIEW employee_details AS
SELECT
    employee_id,
    first_name AS employee_name,
    salary AS monthly_salary
FROM employees;

SELECT *
FROM employee_details;



/*
=========================================================
Example 5
View with JOIN
=========================================================
*/

CREATE OR REPLACE VIEW employee_department AS
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
Example 6
Using ALTER VIEW
=========================================================

Note:
ALTER VIEW is supported in MySQL.
*/

ALTER VIEW employee_details AS
SELECT
    employee_id,
    first_name,
    salary
FROM employees;

SELECT *
FROM employee_details;



/*
=========================================================
Updatable Views
=========================================================

Generally updatable:

✔ Single table

✔ No GROUP BY

✔ No DISTINCT

✔ No Aggregate Functions

✔ No UNION

✔ No Complex Calculations
*/



/*
=========================================================
Non-Updatable Views
=========================================================

Usually NOT updatable:

✖ GROUP BY

✖ HAVING

✖ DISTINCT

✖ Aggregate Functions

✖ UNION

✖ Window Functions

✖ Multiple-table aggregate views
*/



/*
=========================================================
Best Practices
=========================================================

✔ Prefer CREATE OR REPLACE VIEW when modifying
   an existing view.

✔ Keep view names meaningful.

✔ Avoid unnecessary complexity.

✔ Use aliases for better readability.

✔ Test the view after every modification.

✔ Document changes for team projects.
*/