# Phase 08 – Window Functions

## Overview

This phase introduces SQL Window Functions, a powerful feature for performing calculations across a set of rows without grouping the result. Window functions are widely used in data analysis, reporting, business intelligence, and ranking scenarios.

## Topics Covered

* `ROW_NUMBER()`
* `RANK()`
* `DENSE_RANK()`
* `NTILE()`
* `LAG()`
* `LEAD()`

## Files

| File             | Description                                     |
| ---------------- | ----------------------------------------------- |
| `ROW_NUMBER.sql` | Assign a unique sequential number to each row   |
| `RANK.sql`       | Rank rows with gaps when duplicate values exist |
| `DENSE_RANK.sql` | Rank rows without gaps for duplicate values     |
| `NTILE.sql`      | Divide rows into a specified number of groups   |
| `LAG.sql`        | Access values from the previous row             |
| `LEAD.sql`       | Access values from the next row                 |

## Learning Objectives

After completing this phase, you will be able to:

* Assign rankings to rows.
* Generate sequential row numbers.
* Compare current rows with previous or next rows.
* Divide data into equal groups.
* Perform analytical calculations without using `GROUP BY`.
* Solve real-world reporting and business intelligence problems.

## Example Concepts

* Rank employees by salary
* Top N employees in each department
* Compare monthly sales with the previous month
* Calculate salary differences between employees
* Divide customers into quartiles
* Analyze trends over time

## Key Window Clauses

| Clause         | Purpose                                              |
| -------------- | ---------------------------------------------------- |
| `OVER()`       | Defines the window for the calculation               |
| `PARTITION BY` | Splits data into groups before applying the function |
| `ORDER BY`     | Determines the order of rows within each partition   |

## Common Window Functions

| Function       | Description                            |
| -------------- | -------------------------------------- |
| `ROW_NUMBER()` | Assigns a unique row number            |
| `RANK()`       | Assigns a rank with gaps               |
| `DENSE_RANK()` | Assigns a rank without gaps            |
| `NTILE(n)`     | Divides rows into *n* groups           |
| `LAG()`        | Retrieves a value from a previous row  |
| `LEAD()`       | Retrieves a value from a following row |

## Prerequisites

Before starting this phase, you should understand:

* `SELECT`
* `WHERE`
* Aggregate Functions
* `GROUP BY`
* `HAVING`
* Joins
* Subqueries

## Next Phase

➡️ **Phase 09 – Common Table Expressions (CTEs)**

Learn how to write readable and reusable SQL queries using Common Table Expressions, including recursive CTEs.

---




## Previous Phase

- Set Operators

## Cureent Phase

- Window Functions

## Next Phase

-  CTEs

