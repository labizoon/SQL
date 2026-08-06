/*
=========================================================
SQL VIEWS
VIEW vs TABLE
=========================================================

Description:
A table is a physical database object that stores
data permanently.

A view is a virtual table created from the result
of a SQL query. It stores only the query definition,
not the actual data.

Understanding the differences between tables and
views helps you choose the right object for storing
or presenting data.
*/


/*
=========================================================
Example 1
Creating a Table
=========================================================
*/

CREATE TABLE employees_backup
(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2)
);


/*
=========================================================
Insert Data into the Table
=========================================================
*/

INSERT INTO employees_backup
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees;


SELECT *
FROM employees_backup;



/*
=========================================================
Example 2
Creating a View
=========================================================
*/

CREATE VIEW employee_salary_view AS
SELECT
    employee_id,
    first_name,
    salary
FROM employees;


SELECT *
FROM employee_salary_view;



/*
=========================================================
Example 3
View Reflects Changes Automatically
=========================================================

If an employee's salary changes in the employees
table, the view will display the updated value
because it retrieves data from the base table.
*/

UPDATE employees
SET salary = 70000
WHERE employee_id = 1;

SELECT *
FROM employee_salary_view;



/*
=========================================================
Example 4
Table Stores Data Independently
=========================================================

The backup table keeps its own copy of the data.
Changes made to the employees table will not
automatically update the backup table.
*/

SELECT *
FROM employees_backup;



/*
=========================================================
TABLE vs VIEW
=========================================================

Feature                     TABLE              VIEW
------------------------------------------------------------
Stores Data                 Yes                No
Physical Object             Yes                No
Virtual Object              No                 Yes
Can Insert Data             Yes                Limited
Can Update Data             Yes                Limited
Can Delete Data             Yes                Limited
Requires Storage            Yes                Minimal
Based on Query              No                 Yes
Uses JOINs                  Optional           Yes
Best for Reports            No                 Yes
Best for Data Storage       Yes                No
*/


/*
=========================================================
When to Use a TABLE
=========================================================

✔ Store business data

✔ Store transaction records

✔ Maintain historical data

✔ Perform INSERT, UPDATE, DELETE operations

✔ Build the main database structure
*/


/*
=========================================================
When to Use a VIEW
=========================================================

✔ Hide sensitive columns

✔ Simplify complex queries

✔ Create reusable reports

✔ Combine data from multiple tables

✔ Restrict user access to specific columns
*/


/*
=========================================================
Advantages of Views
=========================================================

✔ Easy to maintain

✔ Reusable

✔ Secure

✔ Simplifies reporting

✔ Always displays current data
*/


/*
=========================================================
Advantages of Tables
=========================================================

✔ Permanent storage

✔ Better performance for write operations

✔ Supports indexes

✔ Supports constraints

✔ Stores historical information
*/


/*
=========================================================
Summary
=========================================================

TABLE
-----
• Stores actual data
• Occupies storage space
• Supports all DML operations
• Used for permanent data storage

VIEW
----
• Stores only the SQL query
• Retrieves data from tables
• Simplifies complex queries
• Used for reporting and security
*/