/*
=========================================================
SQL INDEXES
UNIQUE INDEX
=========================================================

Description:
A UNIQUE INDEX ensures that all values in the
indexed column are unique.

Unlike a normal index, a unique index prevents
duplicate values from being inserted into the
column.

Syntax:

CREATE UNIQUE INDEX index_name
ON table_name(column_name);

Common Uses:

• Email Address
• Username
• National ID
• Passport Number
• Employee Code
*/


/*
=========================================================
Example 1
Create a Unique Index on Email
=========================================================
*/

CREATE UNIQUE INDEX idx_employee_email
ON employees(email);



/*
=========================================================
Example 2
Insert Unique Email
=========================================================
*/

INSERT INTO employees
(
    employee_id,
    first_name,
    last_name,
    email
)
VALUES
(
    101,
    'Ali',
    'Khan',
    'ali@example.com'
);



/*
=========================================================
Example 3
Attempt to Insert Duplicate Email
=========================================================

This statement will fail because the email
already exists.
*/

INSERT INTO employees
(
    employee_id,
    first_name,
    last_name,
    email
)
VALUES
(
    102,
    'Ahmed',
    'Ali',
    'ali@example.com'
);



/*
=========================================================
Example 4
Unique Index on Username
=========================================================
*/

CREATE UNIQUE INDEX idx_employee_username
ON employees(username);



/*
=========================================================
Example 5
Unique Composite Index
=========================================================

A combination of columns must be unique.
*/

CREATE UNIQUE INDEX idx_employee_name
ON employees(first_name, last_name);



/*
=========================================================
Verify Data
=========================================================
*/

SELECT
    employee_id,
    first_name,
    last_name,
    email
FROM employees;



/*
=========================================================
UNIQUE INDEX vs NORMAL INDEX
=========================================================

NORMAL INDEX

✔ Improves performance

✔ Allows duplicate values



UNIQUE INDEX

✔ Improves performance

✔ Prevents duplicate values
*/



/*
=========================================================
Advantages
=========================================================

✔ Prevents duplicate records

✔ Improves search performance

✔ Maintains data integrity

✔ Useful for business rules
*/



/*
=========================================================
Common Real-World Uses
=========================================================

✔ Email

✔ Username

✔ Employee Number

✔ Passport Number

✔ National ID

✔ Product SKU
*/



/*
=========================================================
Best Practices
=========================================================

✔ Create unique indexes only on columns that
must contain unique values.

✔ Avoid creating unique indexes on columns
that legitimately contain duplicate values.

✔ Use meaningful index names.

✔ Test duplicate inserts after creating the
index to verify it works correctly.
*/