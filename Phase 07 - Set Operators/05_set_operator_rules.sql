/*
=========================================================
SQL SET OPERATORS - RULES & BEST PRACTICES
=========================================================

Set operators are used to combine the results
of two or more SELECT statements.

Operators:
1. UNION
2. UNION ALL
3. INTERSECT
4. EXCEPT (MINUS in Oracle)
*/


/*
=========================================================
RULE 1
Same Number of Columns
=========================================================
*/

-- Correct

SELECT employee_id, first_name
FROM employees

UNION

SELECT employee_id, first_name
FROM managers;


-- Incorrect

SELECT employee_id
FROM employees

UNION

SELECT employee_id, first_name
FROM managers;



/*
=========================================================
RULE 2
Compatible Data Types
=========================================================
*/

-- Correct

SELECT employee_id
FROM employees

UNION

SELECT manager_id
FROM departments;


-- Incorrect

SELECT employee_id
FROM employees

UNION

SELECT hire_date
FROM employees;



/*
=========================================================
RULE 3
Column Names
=========================================================

The column names in the final result are taken
from the FIRST SELECT statement.
*/

SELECT employee_id AS id,
       first_name AS employee_name
FROM employees

UNION

SELECT manager_id,
       manager_name
FROM managers;



/*
=========================================================
RULE 4
ORDER BY
=========================================================

ORDER BY can appear only once,
after the final SELECT statement.
*/

SELECT first_name
FROM employees

UNION

SELECT manager_name
FROM managers

ORDER BY first_name;



/*
=========================================================
RULE 5
UNION vs UNION ALL
=========================================================

UNION
- Removes duplicate rows.
- Slightly slower.

UNION ALL
- Keeps duplicate rows.
- Faster.
*/

SELECT first_name
FROM employees

UNION

SELECT first_name
FROM managers;


SELECT first_name
FROM employees

UNION ALL

SELECT first_name
FROM managers;



/*
=========================================================
RULE 6
INTERSECT
=========================================================

Returns only rows present
in BOTH result sets.
*/

SELECT employee_id
FROM employees
WHERE department_id = 1

INTERSECT

SELECT employee_id
FROM employees
WHERE salary > 60000;



/*
=========================================================
RULE 7
EXCEPT
=========================================================

Returns rows present in the
FIRST query but NOT in the SECOND.
*/

SELECT employee_id
FROM employees

EXCEPT

SELECT manager_id
FROM employees;



/*
=========================================================
RULE 8
Database Support
=========================================================

MySQL
✔ UNION
✔ UNION ALL
✖ INTERSECT
✖ EXCEPT

PostgreSQL
✔ UNION
✔ UNION ALL
✔ INTERSECT
✔ EXCEPT

SQL Server
✔ UNION
✔ UNION ALL
✔ INTERSECT
✔ EXCEPT

Oracle
✔ UNION
✔ UNION ALL
✔ INTERSECT
✔ MINUS (instead of EXCEPT)
*/



/*
=========================================================
BEST PRACTICES
=========================================================

✔ Ensure both queries return the same number of columns.

✔ Keep corresponding column data types compatible.

✔ Use UNION ALL when duplicate removal is unnecessary.

✔ Use ORDER BY only once at the end.

✔ Prefer UNION ALL for better performance when duplicates
  do not matter.

✔ Use INTERSECT to find common records.

✔ Use EXCEPT (or MINUS in Oracle) to find missing records.

✔ For MySQL, use JOIN, EXISTS, NOT EXISTS, or NOT IN
  as alternatives to INTERSECT and EXCEPT.
*/