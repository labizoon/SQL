/*
=========================================================
SQL INDEXES
SOLUTIONS
=========================================================
*/


-- =====================================================
-- Solution 1
-- Create Index on first_name
-- =====================================================

CREATE INDEX idx_employee_first_name
ON employees(first_name);



-- =====================================================
-- Solution 2
-- Create Index on salary
-- =====================================================

CREATE INDEX idx_employee_salary
ON employees(salary);



-- =====================================================
-- Solution 3
-- Create Index on hire_date
-- =====================================================

CREATE INDEX idx_employee_hire_date
ON employees(hire_date);



-- =====================================================
-- Solution 4
-- Create Unique Index on email
-- =====================================================

CREATE UNIQUE INDEX idx_employee_email
ON employees(email);



-- =====================================================
-- Solution 5
-- Create Unique Index on username
-- =====================================================

CREATE UNIQUE INDEX idx_employee_username
ON employees(username);



-- =====================================================
-- Solution 6
-- Create Composite Index
-- =====================================================

CREATE INDEX idx_department_salary
ON employees(department_id, salary);



-- =====================================================
-- Solution 7
-- Create Composite Index
-- =====================================================

CREATE INDEX idx_customer_order_date
ON orders(customer_id, order_date);



-- =====================================================
-- Solution 8
-- Drop Index
-- =====================================================

DROP INDEX idx_employee_salary
ON employees;



-- =====================================================
-- Solution 9
-- Drop Index
-- =====================================================

DROP INDEX idx_employee_email
ON employees;



-- =====================================================
-- Solution 10
-- Improve WHERE Performance
-- =====================================================

CREATE INDEX idx_employee_department
ON employees(department_id);



-- =====================================================
-- Solution 11
-- Improve JOIN Performance
-- =====================================================

CREATE INDEX idx_employee_department
ON employees(department_id);



-- =====================================================
-- Solution 12
-- Which Object Guarantees Uniqueness?
-- =====================================================

/*
Answer:

b) Unique Index

A UNIQUE INDEX prevents duplicate values
in the indexed column(s).
*/



-- =====================================================
-- Solution 13
-- Which Object Automatically Creates an Index?
-- =====================================================

/*
Answer:

a) Primary Key

Most database systems automatically create
an index for the PRIMARY KEY.
*/



-- =====================================================
-- Challenge Solution 1
-- Optimize Filtering and Sorting
-- =====================================================

CREATE INDEX idx_department_hire_date
ON employees(department_id, hire_date);



-- =====================================================
-- Challenge Solution 2
-- Customer Search Index
-- =====================================================

CREATE INDEX idx_customer_last_name
ON customers(last_name);



-- =====================================================
-- Challenge Solution 3
-- Composite Index
-- =====================================================

CREATE INDEX idx_customer_order_total
ON orders
(
    customer_id,
    order_date,
    total_amount
);



-- =====================================================
-- Challenge Solution 4
-- Display Existing Indexes
-- =====================================================

SHOW INDEX
FROM employees;



-- =====================================================
-- Challenge Solution 5
-- Why Too Many Indexes Reduce Performance
-- =====================================================

/*
Answer:

Too many indexes increase the work required
during INSERT, UPDATE, and DELETE operations
because each index must also be updated.

Effects include:

✔ Increased storage usage

✔ Slower INSERT operations

✔ Slower UPDATE operations

✔ Slower DELETE operations

✔ Longer maintenance time

Indexes should be created only for columns
that improve query performance.
*/