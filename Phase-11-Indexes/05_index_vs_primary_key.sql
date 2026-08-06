/*
=========================================================
SQL INDEXES
INDEX vs PRIMARY KEY
=========================================================

Description:
Both Primary Keys and Indexes improve data access,
but they serve different purposes.

A PRIMARY KEY uniquely identifies each row in a
table, while an INDEX mainly improves query
performance.

Understanding the differences is essential for
database design.
*/


/*
=========================================================
Example 1
Create a Table with Primary Key
=========================================================
*/

CREATE TABLE employees
(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2)
);



/*
=========================================================
Example 2
Primary Key Lookup
=========================================================
*/

SELECT *
FROM employees
WHERE employee_id = 101;



/*
=========================================================
Example 3
Create an Index
=========================================================
*/

CREATE INDEX idx_employee_department
ON employees(department_id);



/*
=========================================================
Query Using the Index
=========================================================
*/

SELECT *
FROM employees
WHERE department_id = 2;



/*
=========================================================
Example 4
Unique Index
=========================================================
*/

CREATE UNIQUE INDEX idx_employee_email
ON employees(email);

SELECT *
FROM employees
WHERE email = 'ali@example.com';



/*
=========================================================
PRIMARY KEY vs INDEX
=========================================================

Feature                 PRIMARY KEY         INDEX
---------------------------------------------------------
Purpose                 Uniquely identifies Improves search
                        each row            performance

Duplicate Values        Not Allowed         Allowed
                                           (unless UNIQUE)

NULL Values             Not Allowed         Allowed
                                           (except UNIQUE rules)

Number Per Table        One                 Many

Automatically Indexed   Yes                 No

Used for Relationships  Yes                 Usually No

Storage                 Uses Index          Uses Storage
*/



/*
=========================================================
When to Use a Primary Key
=========================================================

✔ Every table should have one.

✔ Identify each record uniquely.

✔ Build relationships with foreign keys.

✔ Ensure entity integrity.
*/



/*
=========================================================
When to Use an Index
=========================================================

✔ Frequently searched columns.

✔ JOIN columns.

✔ ORDER BY columns.

✔ GROUP BY columns.

✔ Frequently filtered columns.
*/



/*
=========================================================
Real-World Examples
=========================================================

Employees Table

PRIMARY KEY

employee_id


Useful Indexes

email

department_id

hire_date

last_name
*/



/*
=========================================================
Best Practices
=========================================================

✔ Always define a Primary Key.

✔ Create indexes only where they improve
query performance.

✔ Do not create unnecessary indexes.

✔ Use UNIQUE INDEX when duplicate values
must be prevented.

✔ Review indexes regularly.
*/



/*
=========================================================
Summary
=========================================================

PRIMARY KEY

✔ Unique

✔ One per table

✔ No NULL values

✔ Automatically indexed


INDEX

✔ Improves performance

✔ Multiple per table

✔ May allow duplicates

✔ Optional
*/