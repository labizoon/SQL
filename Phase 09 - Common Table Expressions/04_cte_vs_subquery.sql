/*
=========================================================
SQL COMMON TABLE EXPRESSIONS (CTEs)
CTE vs SUBQUERY
=========================================================

Description:
Both CTEs and subqueries are used to simplify SQL
queries, but they serve different purposes.

A subquery is a query inside another query.

A CTE is a temporary named result set that can
be referenced multiple times within the same SQL
statement.

Choosing between them depends on readability,
complexity, and reusability.
*/


/*
=========================================================
Example 1
Subquery
Employees Earning Above Average Salary
=========================================================
*/

SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);



/*
=========================================================
Example 1
CTE
Employees Earning Above Average Salary
=========================================================
*/

WITH average_salary AS
(
    SELECT AVG(salary) AS avg_salary
    FROM employees
)

SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE salary >
(
    SELECT avg_salary
    FROM average_salary
);



/*
=========================================================
Example 2
Subquery
Department Average Salary
=========================================================
*/

SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) >
(
    SELECT AVG(salary)
    FROM employees
);



/*
=========================================================
Example 2
CTE
Department Average Salary
=========================================================
*/

WITH department_average AS
(
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)

SELECT *
FROM department_average
WHERE average_salary >
(
    SELECT AVG(salary)
    FROM employees
);



/*
=========================================================
Example 3
Nested Subqueries
=========================================================
*/

SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE department_id IN
(
    SELECT department_id
    FROM departments
    WHERE location_id =
    (
        SELECT location_id
        FROM locations
        WHERE city = 'New York'
    )
);



/*
=========================================================
Example 3
Using CTEs
=========================================================
*/

WITH new_york_location AS
(
    SELECT location_id
    FROM locations
    WHERE city = 'New York'
),

department_list AS
(
    SELECT department_id
    FROM departments
    WHERE location_id IN
    (
        SELECT location_id
        FROM new_york_location
    )
)

SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE department_id IN
(
    SELECT department_id
    FROM department_list
);



/*
=========================================================
Example 4
Top 3 Highest Paid Employees
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
WHERE rn <= 3;



/*
=========================================================
Example 5
Using a CTE Multiple Times
=========================================================
*/

WITH department_salary AS
(
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)

SELECT *
FROM department_salary
WHERE average_salary > 60000

UNION ALL

SELECT *
FROM department_salary
WHERE average_salary <= 60000;



/*
=========================================================
CTE vs Subquery
=========================================================

Feature                     CTE        Subquery
-------------------------------------------------------
Readability                 Excellent Good
Reusable                    Yes        No
Recursive                   Yes        No
Multiple References         Yes        No
Complex Queries             Excellent Fair
Simple Queries              Good       Excellent
Temporary Named Result      Yes        No
*/


/*
=========================================================
When to Use a CTE
=========================================================

✔ Large SQL queries

✔ Multiple calculations

✔ Recursive queries

✔ Window functions

✔ Improved readability

✔ Reusing the same result
*/


/*
=========================================================
When to Use a Subquery
=========================================================

✔ Simple filtering

✔ Single calculation

✔ EXISTS

✔ IN

✔ Scalar subqueries

✔ Small queries
*/


/*
=========================================================
Best Practices
=========================================================

✔ Use subqueries for simple one-time operations.

✔ Use CTEs when the query becomes difficult to read.

✔ Give CTEs meaningful names.

✔ Break complex logic into multiple CTEs.

✔ Avoid creating unnecessary CTEs for very small
queries.

✔ Use recursive CTEs only for hierarchical data.
*/