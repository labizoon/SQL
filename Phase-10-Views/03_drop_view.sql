/*
=========================================================
SQL VIEWS
DROP VIEW
=========================================================

Description:
A view can be removed from the database using
the DROP VIEW statement.

Dropping a view removes only the view itself.
The underlying table and its data remain
unchanged.

Syntax:

DROP VIEW view_name;

or

DROP VIEW IF EXISTS view_name;
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

SELECT *
FROM employee_details;



/*
=========================================================
Example 2
Drop the View
=========================================================
*/

DROP VIEW employee_details;



/*
=========================================================
Example 3
Drop a View Safely
=========================================================

IF EXISTS prevents an error if the view
does not exist.
*/

DROP VIEW IF EXISTS employee_details;



/*
=========================================================
Example 4
Create Multiple Views
=========================================================
*/

CREATE VIEW high_salary_employees AS
SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE salary > 60000;


CREATE VIEW active_employees AS
SELECT
    employee_id,
    first_name,
    status
FROM employees
WHERE status = 'Active';


SELECT *
FROM high_salary_employees;

SELECT *
FROM active_employees;



/*
=========================================================
Example 5
Drop Multiple Views
=========================================================
*/

DROP VIEW
    high_salary_employees,
    active_employees;



/*
=========================================================
Example 6
Drop Multiple Views Safely
=========================================================
*/

DROP VIEW IF EXISTS
    high_salary_employees,
    active_employees;



/*
=========================================================
Important Notes
=========================================================

✔ Dropping a view DOES NOT delete data
  from the base table.

✔ Only the view definition is removed.

✔ Any applications or queries depending on
  the view will no longer work.

✔ Recreate the view using CREATE VIEW if needed.
*/



/*
=========================================================
Example 7
Verify That Table Still Exists
=========================================================
*/

SELECT *
FROM employees;



/*
=========================================================
Best Practices
=========================================================

✔ Use IF EXISTS to avoid unnecessary errors.

✔ Check dependencies before dropping a view.

✔ Remove unused views to keep the database clean.

✔ Keep backups of important view definitions.

✔ Use meaningful names for views.
*/



/*
=========================================================
Summary
=========================================================

Create View
-----------
CREATE VIEW view_name AS
SELECT ...

Modify View
-----------
CREATE OR REPLACE VIEW view_name AS
SELECT ...

Drop View
---------
DROP VIEW view_name;

Drop View Safely
----------------
DROP VIEW IF EXISTS view_name;
*/