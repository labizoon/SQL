/*
=========================================================
SQL INDEXES
BEST PRACTICES
=========================================================

Description:
Indexes improve query performance, but creating
too many or unnecessary indexes can reduce
overall database performance.

This file covers recommended practices for
designing and maintaining indexes.
*/


/*
=========================================================
BEST PRACTICE 1
Index Frequently Searched Columns
=========================================================
*/

-- Good

CREATE INDEX idx_employee_last_name
ON employees(last_name);

SELECT *
FROM employees
WHERE last_name = 'Khan';



/*
=========================================================
BEST PRACTICE 2
Index Foreign Keys
=========================================================
*/

CREATE INDEX idx_employee_department
ON employees(department_id);

SELECT
    e.employee_id,
    e.first_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;



/*
=========================================================
BEST PRACTICE 3
Index Columns Used in ORDER BY
=========================================================
*/

CREATE INDEX idx_employee_hire_date
ON employees(hire_date);

SELECT *
FROM employees
ORDER BY hire_date;



/*
=========================================================
BEST PRACTICE 4
Use Composite Indexes Wisely
=========================================================
*/

CREATE INDEX idx_department_salary
ON employees(department_id, salary);

SELECT *
FROM employees
WHERE department_id = 3
AND salary > 70000;



/*
=========================================================
BEST PRACTICE 5
Avoid Indexing Every Column
=========================================================

Too many indexes:

✖ Increase storage usage

✖ Slow INSERT operations

✖ Slow UPDATE operations

✖ Slow DELETE operations
*/



/*
=========================================================
BEST PRACTICE 6
Avoid Indexing Small Tables
=========================================================

For very small tables, a full table scan
is often faster than using an index.
*/



/*
=========================================================
BEST PRACTICE 7
Use UNIQUE INDEX When Needed
=========================================================
*/

CREATE UNIQUE INDEX idx_employee_email
ON employees(email);



/*
=========================================================
BEST PRACTICE 8
Review Unused Indexes
=========================================================

Remove indexes that are rarely or never used.

Example:

DROP INDEX idx_old_index
ON employees;
*/



/*
=========================================================
BEST PRACTICE 9
Choose Good Index Names
=========================================================

Good Examples

idx_employee_email

idx_employee_department

idx_customer_order_date

Avoid

index1

myindex

test_index
*/



/*
=========================================================
BEST PRACTICE 10
Measure Performance
=========================================================

Always compare query performance before
and after creating an index.

Example:

EXPLAIN
SELECT *
FROM employees
WHERE department_id = 2;
*/



/*
=========================================================
COMMON MISTAKES
=========================================================

✖ Creating indexes on every column

✖ Duplicate indexes

✖ Ignoring composite indexes

✖ Wrong column order

✖ Never removing unused indexes

✖ Assuming indexes always improve performance
*/



/*
=========================================================
PERFORMANCE TIPS
=========================================================

✔ Index WHERE columns

✔ Index JOIN columns

✔ Index ORDER BY columns

✔ Index GROUP BY columns

✔ Keep indexes small

✔ Monitor execution plans regularly
*/



/*
=========================================================
WHEN TO CREATE AN INDEX
=========================================================

✔ Large tables

✔ Frequently searched data

✔ Frequent JOIN operations

✔ Frequent sorting

✔ Frequent grouping
*/



/*
=========================================================
WHEN NOT TO CREATE AN INDEX
=========================================================

✖ Very small tables

✖ Columns with frequent updates

✖ Rarely searched columns

✖ Temporary tables

✖ Duplicate indexes
*/



/*
=========================================================
SUMMARY
=========================================================

✔ Create indexes only when necessary.

✔ Use meaningful names.

✔ Index frequently searched columns.

✔ Monitor performance.

✔ Remove unused indexes.

✔ Review composite indexes carefully.

✔ Test queries after adding indexes.
*/