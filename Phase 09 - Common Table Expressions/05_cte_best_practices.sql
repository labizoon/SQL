/*
=========================================================
SQL COMMON TABLE EXPRESSIONS (CTEs)
RULES & BEST PRACTICES
=========================================================

Description:
A Common Table Expression (CTE) is a temporary,
named result set that exists only during the
execution of a single SQL statement.

CTEs improve readability, simplify complex SQL,
and make queries easier to maintain.
*/


/*
=========================================================
RULE 1
A CTE Must Start with WITH
=========================================================

Syntax:
*/

WITH employee_list AS
(
    SELECT
        employee_id,
        first_name
    FROM employees
)

SELECT *
FROM employee_list;



/*
=========================================================
RULE 2
A CTE Exists Only for One Statement
=========================================================

The CTE is available only for the SQL statement
immediately following it.

Incorrect:

WITH employee_list AS (...)
SELECT * FROM employee_list;

SELECT * FROM employee_list;
-- Error: CTE no longer exists.
*/



/*
=========================================================
RULE 3
Meaningful CTE Names
=========================================================

Good Examples:
--------------
department_salary
recent_orders
top_customers
employee_ranking

Avoid:
------
cte1
temp
data
result
*/



/*
=========================================================
RULE 4
Multiple CTEs
=========================================================

Separate multiple CTEs with commas.
*/

WITH department_salary AS
(
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
),

high_salary_departments AS
(
    SELECT *
    FROM department_salary
    WHERE average_salary > 60000
)

SELECT *
FROM high_salary_departments;



/*
=========================================================
RULE 5
A CTE Can Reference Earlier CTEs
=========================================================
*/

WITH employee_salary AS
(
    SELECT
        employee_id,
        department_id,
        salary
    FROM employees
),

department_average AS
(
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employee_salary
    GROUP BY department_id
)

SELECT *
FROM department_average;



/*
=========================================================
RULE 6
Recursive CTEs
=========================================================

Recursive CTEs require:

✔ Anchor Member
✔ UNION ALL
✔ Recursive Member
✔ Stopping Condition
*/

WITH RECURSIVE numbers AS
(
    SELECT 1 AS number

    UNION ALL

    SELECT number + 1
    FROM numbers
    WHERE number < 5
)

SELECT *
FROM numbers;



/*
=========================================================
RULE 7
CTEs Improve Readability
=========================================================

Instead of writing one huge query,
split it into smaller logical steps.

Example:
*/

WITH recent_employees AS
(
    SELECT *
    FROM employees
    WHERE hire_date >= '2024-01-01'
),

high_salary AS
(
    SELECT *
    FROM recent_employees
    WHERE salary > 70000
)

SELECT *
FROM high_salary;



/*
=========================================================
RULE 8
CTEs Work Well with Window Functions
=========================================================
*/

WITH ranked_employees AS
(
    SELECT
        employee_id,
        first_name,
        salary,
        ROW_NUMBER() OVER
        (
            ORDER BY salary DESC
        ) AS rn
    FROM employees
)

SELECT
    employee_id,
    first_name,
    salary
FROM ranked_employees
WHERE rn <= 5;



/*
=========================================================
RULE 9
Avoid Unnecessary CTEs
=========================================================

Good:
-----
Use a CTE for complex or reusable logic.

Bad:
----
Don't create a CTE for a simple query that
can be written directly.
*/



/*
=========================================================
RULE 10
Performance Considerations
=========================================================

✔ Keep CTEs as small as possible.

✔ Filter rows early.

✔ Select only the required columns.

✔ Avoid unnecessary nesting.

✔ Index columns used in JOIN and WHERE.

✔ Test execution plans for large queries.
*/



/*
=========================================================
WHEN TO USE A CTE
=========================================================

✔ Complex SQL

✔ Multiple JOINs

✔ Window Functions

✔ Recursive Queries

✔ Reporting Queries

✔ Data Transformation

✔ Multi-step Calculations
*/



/*
=========================================================
WHEN NOT TO USE A CTE
=========================================================

✖ Very small queries

✖ One-line filtering

✖ Simple scalar subqueries

✖ Extremely performance-critical queries
(where testing shows another approach is faster)
*/



/*
=========================================================
CTE ADVANTAGES
=========================================================

✔ Improves readability

✔ Easy to debug

✔ Easy to maintain

✔ Supports recursion

✔ Can be referenced multiple times

✔ Reduces repeated code
*/



/*
=========================================================
CTE LIMITATIONS
=========================================================

✖ Temporary

✖ Exists for only one statement

✖ Cannot be referenced later

✖ Not intended for permanent storage
*/



/*
=========================================================
SUMMARY
=========================================================

A CTE is best when you want to:

• Break a large query into smaller steps.

• Improve readability.

• Reuse intermediate results.

• Write recursive queries.

• Combine with window functions.

Following these practices makes SQL code easier
to understand, maintain, and debug.
*/