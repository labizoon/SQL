/*
=========================================================
SQL INDEXES
CREATING INDEXES
=========================================================

Description:
An index is a database object that improves the
speed of data retrieval operations.

Instead of scanning every row in a table, the
database uses the index to quickly locate the
required records.

Indexes improve the performance of:

• SELECT
• WHERE
• JOIN
• ORDER BY
• GROUP BY

However, indexes also require storage space and
can slightly slow down INSERT, UPDATE, and DELETE
operations because the index must be maintained.

Syntax:

CREATE INDEX index_name
ON table_name(column_name);
*/


/*
=========================================================
Example 1
Create a Simple Index
=========================================================
*/

CREATE INDEX idx_employee_first_name
ON employees(first_name);



/*
=========================================================
Retrieve Employees
(The database may use the index.)
=========================================================
*/

SELECT *
FROM employees
WHERE first_name = 'Ali';



/*
=========================================================
Example 2
Index on Salary
=========================================================
*/

CREATE INDEX idx_employee_salary
ON employees(salary);

SELECT *
FROM employees
WHERE salary > 60000;



/*
=========================================================
Example 3
Index Used with ORDER BY
=========================================================
*/

CREATE INDEX idx_employee_hire_date
ON employees(hire_date);

SELECT
    employee_id,
    first_name,
    hire_date
FROM employees
ORDER BY hire_date;



/*
=========================================================
Example 4
Index Used with JOIN
=========================================================
*/

CREATE INDEX idx_department_id
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
Example 5
Index on Email
=========================================================
*/

CREATE INDEX idx_employee_email
ON employees(email);

SELECT *
FROM employees
WHERE email = 'ali@example.com';



/*
=========================================================
Advantages of Indexes
=========================================================

✔ Faster data retrieval

✔ Improves WHERE performance

✔ Speeds up JOIN operations

✔ Improves ORDER BY performance

✔ Improves GROUP BY performance
*/



/*
=========================================================
Disadvantages of Indexes
=========================================================

✖ Uses additional disk space

✖ Slows INSERT operations

✖ Slows UPDATE operations

✖ Slows DELETE operations

✖ Too many indexes can reduce performance
*/



/*
=========================================================
Common Use Cases
=========================================================

✔ Primary Keys

✔ Foreign Keys

✔ Frequently searched columns

✔ Frequently joined columns

✔ Frequently sorted columns
*/



/*
=========================================================
Best Practices
=========================================================

✔ Create indexes only when needed.

✔ Index columns used frequently in WHERE clauses.

✔ Index foreign keys used in JOINs.

✔ Avoid indexing small tables.

✔ Avoid creating unnecessary indexes.

✔ Monitor query performance before and after
creating indexes.
*/