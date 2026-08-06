/*
=========================================================
SQL INDEXES
COMPOSITE INDEXES
=========================================================

Description:
A Composite Index (also called a Multi-Column
Index) is an index created on two or more columns.

It is useful when queries frequently filter or
sort using the same combination of columns.

Syntax:

CREATE INDEX index_name
ON table_name(column1, column2);

Important:
The order of columns in a composite index matters.
*/


/*
=========================================================
Example 1
Create a Composite Index
=========================================================
*/

CREATE INDEX idx_department_salary
ON employees(department_id, salary);



/*
=========================================================
Query Using Both Columns
=========================================================
*/

SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE department_id = 2
AND salary > 60000;



/*
=========================================================
Example 2
Composite Index with ORDER BY
=========================================================
*/

CREATE INDEX idx_department_hire_date
ON employees(department_id, hire_date);

SELECT
    employee_id,
    first_name,
    hire_date
FROM employees
WHERE department_id = 1
ORDER BY hire_date;



/*
=========================================================
Example 3
Composite Index on Customer Orders
=========================================================
*/

CREATE INDEX idx_customer_order_date
ON orders(customer_id, order_date);

SELECT
    order_id,
    customer_id,
    order_date
FROM orders
WHERE customer_id = 101
ORDER BY order_date;



/*
=========================================================
Example 4
When the Index Can Be Used
=========================================================

The composite index on:

(department_id, salary)

can help queries like:

WHERE department_id = 2

or

WHERE department_id = 2
AND salary > 60000
*/

SELECT *
FROM employees
WHERE department_id = 2;

SELECT *
FROM employees
WHERE department_id = 2
AND salary > 60000;



/*
=========================================================
Example 5
When the Index May NOT Be Used
=========================================================

Searching only by the second column usually
cannot efficiently use the composite index.
*/

SELECT *
FROM employees
WHERE salary > 60000;



/*
=========================================================
Advantages
=========================================================

✔ Faster searches

✔ Better JOIN performance

✔ Improved ORDER BY

✔ Improved GROUP BY

✔ Reduced query execution time
*/



/*
=========================================================
Choosing Column Order
=========================================================

Good Example

(department_id, salary)

If most queries filter by department first.

Bad Example

(salary, department_id)

If salary is rarely used alone and
department_id is always the first filter.

Always place the most commonly searched
or filtered column first.
*/



/*
=========================================================
Best Practices
=========================================================

✔ Keep composite indexes as small as possible.

✔ Avoid creating unnecessary composite indexes.

✔ Choose the correct column order.

✔ Create composite indexes based on actual
query patterns.

✔ Monitor performance regularly.
*/



/*
=========================================================
Summary
=========================================================

Single Index

(first_name)

Composite Index

(department_id, salary)

Composite indexes improve performance for
queries that use multiple columns together.
*/