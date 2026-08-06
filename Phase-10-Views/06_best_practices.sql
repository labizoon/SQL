/*
=========================================================
SQL VIEWS
BEST PRACTICES
=========================================================

Description:
Views are powerful tools for simplifying SQL
queries, improving security, and creating reusable
database objects.

Following best practices helps improve
performance, readability, and maintainability.
*/


/*
=========================================================
BEST PRACTICE 1
Use Meaningful View Names
=========================================================
*/

-- Good
CREATE VIEW employee_salary_report AS
SELECT
    employee_id,
    first_name,
    salary
FROM employees;

-- Bad
CREATE VIEW view1 AS
SELECT *
FROM employees;



/*
=========================================================
BEST PRACTICE 2
Select Only Required Columns
=========================================================
*/

-- Good
CREATE VIEW employee_contact AS
SELECT
    employee_id,
    first_name,
    email
FROM employees;

-- Avoid
CREATE VIEW employee_all_data AS
SELECT *
FROM employees;



/*
=========================================================
BEST PRACTICE 3
Filter Data When Necessary
=========================================================
*/

CREATE VIEW active_employees AS
SELECT
    employee_id,
    first_name,
    department_id
FROM employees
WHERE status = 'Active';



/*
=========================================================
BEST PRACTICE 4
Use Aliases for Better Readability
=========================================================
*/

CREATE VIEW employee_salary_details AS
SELECT
    employee_id,
    first_name AS employee_name,
    salary AS monthly_salary
FROM employees;



/*
=========================================================
BEST PRACTICE 5
Use Views for Security
=========================================================

Hide confidential information such as:

✔ Salary
✔ Password
✔ National ID
✔ Bank Account
✔ Personal Contact Details
*/

CREATE VIEW employee_public_information AS
SELECT
    employee_id,
    first_name,
    last_name,
    department_id
FROM employees;



/*
=========================================================
BEST PRACTICE 6
Avoid Unnecessary Complex Views
=========================================================

Instead of combining many joins and calculations
into one huge view, split the logic into smaller,
more focused views when appropriate.
*/



/*
=========================================================
BEST PRACTICE 7
Avoid SELECT *
=========================================================

Good
*/

CREATE VIEW department_information AS
SELECT
    department_id,
    department_name
FROM departments;

/*
Bad

CREATE VIEW department_information AS
SELECT *
FROM departments;
*/



/*
=========================================================
BEST PRACTICE 8
Document View Purpose
=========================================================

Example:

Employee salary report used by the HR department.

Customer summary used for monthly reporting.

Sales dashboard view used by management.
*/



/*
=========================================================
BEST PRACTICE 9
Keep Views Readable
=========================================================

✔ Proper indentation

✔ Meaningful aliases

✔ Consistent formatting

✔ Comment complex logic
*/



/*
=========================================================
BEST PRACTICE 10
Remove Unused Views
=========================================================

DROP VIEW IF EXISTS old_employee_report;
*/



/*
=========================================================
PERFORMANCE TIPS
=========================================================

✔ Select only required columns.

✔ Filter rows early using WHERE.

✔ Avoid unnecessary nested views.

✔ Create indexes on columns used in
JOIN and WHERE conditions.

✔ Avoid heavy calculations inside views.

✔ Test performance on large datasets.
*/



/*
=========================================================
COMMON MISTAKES
=========================================================

✖ Using SELECT *

✖ Creating unnecessary views

✖ Poor naming conventions

✖ Forgetting dependencies

✖ Assuming every view is updatable

✖ Using views for data storage
*/



/*
=========================================================
WHEN TO USE VIEWS
=========================================================

✔ Reports

✔ Dashboards

✔ Data Security

✔ Reusable Queries

✔ Business Intelligence

✔ Simplifying Complex SQL
*/



/*
=========================================================
WHEN NOT TO USE VIEWS
=========================================================

✖ Permanent Data Storage

✖ High-volume INSERT operations

✖ Frequently changing business logic

✖ Temporary calculations that are
used only once
*/



/*
=========================================================
SUMMARY
=========================================================

✔ Use meaningful names.

✔ Select only required columns.

✔ Avoid SELECT *.

✔ Use views to improve security.

✔ Keep views simple and readable.

✔ Document complex views.

✔ Remove obsolete views.

✔ Monitor performance on large databases.
*/