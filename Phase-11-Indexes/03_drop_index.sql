/*
=========================================================
SQL INDEXES
DROP INDEX
=========================================================

Description:
Indexes can be removed when they are no longer
needed or when they negatively affect database
performance.

Dropping an index removes only the index.

The table structure and data remain unchanged.

MySQL Syntax:

DROP INDEX index_name
ON table_name;
*/


/*
=========================================================
Example 1
Create an Index
=========================================================
*/

CREATE INDEX idx_employee_first_name
ON employees(first_name);



/*
=========================================================
Use the Index
=========================================================
*/

SELECT *
FROM employees
WHERE first_name = 'Ali';



/*
=========================================================
Example 2
Drop the Index
=========================================================
*/

DROP INDEX idx_employee_first_name
ON employees;



/*
=========================================================
Example 3
Create Multiple Indexes
=========================================================
*/

CREATE INDEX idx_employee_salary
ON employees(salary);

CREATE INDEX idx_employee_department
ON employees(department_id);

CREATE INDEX idx_employee_hire_date
ON employees(hire_date);



/*
=========================================================
Queries That May Use the Indexes
=========================================================
*/

SELECT *
FROM employees
WHERE salary > 60000;

SELECT *
FROM employees
WHERE department_id = 2;

SELECT *
FROM employees
ORDER BY hire_date;



/*
=========================================================
Example 4
Drop Multiple Indexes
=========================================================

Indexes must be dropped one at a time.
*/

DROP INDEX idx_employee_salary
ON employees;

DROP INDEX idx_employee_department
ON employees;

DROP INDEX idx_employee_hire_date
ON employees;



/*
=========================================================
Important Notes
=========================================================

✔ Dropping an index does NOT delete data.

✔ Dropping an index does NOT delete the table.

✔ Queries may become slower after removing
an index.

✔ Remove only unnecessary indexes.
*/



/*
=========================================================
Check Existing Indexes
=========================================================

MySQL
*/

SHOW INDEX
FROM employees;



/*
=========================================================
When Should You Drop an Index?
=========================================================

✔ Index is never used.

✔ Duplicate indexes exist.

✔ Poor query performance caused by
too many indexes.

✔ Column is no longer searched frequently.
*/



/*
=========================================================
Best Practices
=========================================================

✔ Analyze query performance before dropping.

✔ Remove duplicate indexes.

✔ Keep indexes on frequently searched columns.

✔ Test application performance after removal.

✔ Document important index changes.
*/



/*
=========================================================
Summary
=========================================================

Create Index
------------

CREATE INDEX idx_name
ON table_name(column_name);

Drop Index
----------

DROP INDEX idx_name
ON table_name;

View Indexes
------------

SHOW INDEX
FROM table_name;
*/