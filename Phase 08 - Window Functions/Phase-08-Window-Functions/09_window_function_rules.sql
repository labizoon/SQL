/*
=========================================================
SQL WINDOW FUNCTIONS - RULES & BEST PRACTICES
=========================================================

Description:
Window functions perform calculations across a
set of rows related to the current row without
grouping the result set.

Unlike GROUP BY, window functions do not reduce
the number of rows.

Syntax:

window_function() OVER (
    [PARTITION BY column_name]
    ORDER BY column_name
    [ROWS/RANGE frame_clause]
);
*/


/*
=========================================================
RULE 1
OVER() Clause is Required
=========================================================
*/

SELECT
    employee_id,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_num
FROM employees;


/*
=========================================================
RULE 2
ORDER BY
=========================================================

Most window functions require ORDER BY.

Examples:
ROW_NUMBER()
RANK()
DENSE_RANK()
NTILE()
LEAD()
LAG()
FIRST_VALUE()
LAST_VALUE()
NTH_VALUE()
*/

SELECT
    employee_id,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


/*
=========================================================
RULE 3
PARTITION BY
=========================================================

PARTITION BY divides the result set into groups.
Each partition is processed independently.
*/

SELECT
    employee_id,
    department_id,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_row
FROM employees;


/*
=========================================================
RULE 4
Window Frame
=========================================================

Window frames determine which rows are included
in calculations such as SUM() and AVG().
*/

SELECT
    employee_id,
    salary,
    SUM(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total
FROM employees;


/*
=========================================================
RULE 5
Window Functions Do Not Collapse Rows
=========================================================

Every input row appears in the output.
*/

SELECT
    employee_id,
    salary,
    AVG(salary) OVER () AS company_average
FROM employees;


/*
=========================================================
RULE 6
Window Functions Execute After GROUP BY
=========================================================

Window functions can operate on aggregated
results.
*/

SELECT
    department_id,
    AVG(salary) AS avg_salary,
    RANK() OVER (
        ORDER BY AVG(salary) DESC
    ) AS department_rank
FROM employees
GROUP BY department_id;


/*
=========================================================
RULE 7
Window Functions Cannot Be Used Directly
in WHERE Clause
=========================================================

Incorrect:

SELECT *
FROM employees
WHERE ROW_NUMBER() OVER (
    ORDER BY salary DESC
) <= 5;

Correct:
*/

SELECT *
FROM
(
    SELECT
        employee_id,
        first_name,
        salary,
        ROW_NUMBER() OVER (
            ORDER BY salary DESC
        ) AS rn
    FROM employees
) ranked_employees
WHERE rn <= 5;


/*
=========================================================
RULE 8
ROW_NUMBER vs RANK vs DENSE_RANK
=========================================================

ROW_NUMBER()
- Unique number
- No ties

RANK()
- Same rank for ties
- Skips numbers

DENSE_RANK()
- Same rank for ties
- No skipped numbers
*/


/*
=========================================================
RULE 9
Running Total vs Moving Average
=========================================================

Running Total:
Includes all previous rows.

Moving Average:
Uses a fixed-size window.
*/


/*
=========================================================
RULE 10
LEAD vs LAG
=========================================================

LAG()
Returns value from previous row.

LEAD()
Returns value from next row.
*/


/*
=========================================================
RULE 11
FIRST_VALUE, LAST_VALUE, NTH_VALUE
=========================================================

FIRST_VALUE()
Returns first value.

LAST_VALUE()
Returns last value.

NTH_VALUE()
Returns nth value.
*/


/*
=========================================================
RULE 12
Performance Tips
=========================================================

✔ Index columns used in ORDER BY.

✔ Partition only when needed.

✔ Avoid unnecessary window functions.

✔ Use explicit window frames for clarity.

✔ Filter data before applying window functions
  whenever possible.

✔ Use ROW_NUMBER() for pagination.

✔ Use RANK() or DENSE_RANK() for leaderboards.

✔ Use LAG() and LEAD() for trend analysis.

✔ Use SUM() OVER() for cumulative totals.

✔ Use AVG() OVER() for moving averages.
*/


/*
=========================================================
WINDOW FUNCTIONS SUMMARY
=========================================================

Ranking
-------
ROW_NUMBER()
RANK()
DENSE_RANK()
NTILE()

Navigation
----------
LEAD()
LAG()

Value
-----
FIRST_VALUE()
LAST_VALUE()
NTH_VALUE()

Aggregate
---------
SUM()
AVG()
COUNT()
MIN()
MAX()

All of these become window functions when
used with the OVER() clause.
*/


/*
=========================================================
COMMON REAL-WORLD USE CASES
=========================================================

✔ Employee salary ranking

✔ Top-N employees

✔ Sales leaderboards

✔ Running sales totals

✔ Moving average reports

✔ Customer purchase history

✔ Revenue trends

✔ Inventory analysis

✔ Financial reporting

✔ Time-series analysis

✔ Department performance comparison
*/