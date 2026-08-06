# Phase 09 – Common Table Expressions (CTEs)

## Overview

This phase covers **Common Table Expressions (CTEs)**, one of the most useful SQL features for writing clean, readable, and maintainable queries.

A CTE is a temporary named result set that exists only during the execution of a single SQL statement. It helps simplify complex queries by breaking them into logical steps.

---

## Learning Objectives

After completing this phase, you will be able to:

- Understand what a Common Table Expression (CTE) is
- Write basic CTEs using the `WITH` clause
- Create multiple CTEs in a single query
- Build recursive CTEs for hierarchical data
- Compare CTEs with subqueries
- Use CTEs with JOINs, aggregate functions, and window functions
- Apply CTE best practices for readable SQL

---

## Topics Covered

- Basic CTE
- Multiple CTEs
- Recursive CTEs
- CTE vs Subquery
- CTE Best Practices
- Practice Questions
- Solutions

---

## Folder Structure

```text
Phase-09-Common-Table-Expressions/
│
├── 01_basic_cte.sql
├── 02_multiple_ctes.sql
├── 03_recursive_cte.sql
├── 04_cte_vs_subquery.sql
├── 05_cte_best_practices.sql
├── 06_practice_questions.sql
├── 07_solutions.sql
├── sample_data.sql
└── README.md
```

---

## File Descriptions

### 01_basic_cte.sql
- Introduction to CTEs
- Basic syntax
- Simple filtering examples
- Aggregate examples

### 02_multiple_ctes.sql
- Multiple CTEs
- Referencing one CTE from another
- CTEs with JOINs
- CTEs with window functions

### 03_recursive_cte.sql
- Recursive CTE syntax
- Anchor member
- Recursive member
- Employee hierarchy
- Number generation
- Date generation

### 04_cte_vs_subquery.sql
- CTE vs Subquery
- Readability comparison
- Performance considerations
- Best use cases

### 05_cte_best_practices.sql
- CTE rules
- Naming conventions
- Performance tips
- Common mistakes
- Best practices

### 06_practice_questions.sql
- Practice exercises covering all CTE concepts
- Challenge questions

### 07_solutions.sql
- Complete solutions for all practice questions

---

## Requirements

- SQL database supporting CTEs

Examples include:

- MySQL 8.0+
- PostgreSQL
- SQL Server
- Oracle

---

## Key Concepts

### Basic CTE

```sql
WITH employee_list AS
(
    SELECT *
    FROM employees
)
SELECT *
FROM employee_list;
```

### Multiple CTEs

```sql
WITH department_salary AS
(
    ...
),
high_salary AS
(
    ...
)
SELECT *
FROM high_salary;
```

### Recursive CTE

```sql
WITH RECURSIVE numbers AS
(
    SELECT 1

    UNION ALL

    SELECT number + 1
    FROM numbers
    WHERE number < 10
)
SELECT *
FROM numbers;
```

---

## Advantages of CTEs

- Improves query readability
- Simplifies complex SQL
- Makes debugging easier
- Supports recursive queries
- Can be referenced multiple times
- Works well with window functions

---

## Limitations

- Exists only for one SQL statement
- Does not permanently store data
- Very large recursive queries can impact performance

---

## Best Practices

- Use meaningful CTE names.
- Keep each CTE focused on a single task.
- Break large queries into multiple CTEs.
- Use recursive CTEs only when necessary.
- Filter data as early as possible.
- Select only the required columns.
- Avoid unnecessary nesting.

---

## Practice

Complete all exercises in:

- `06_practice_questions.sql`

Then verify your answers using:

- `07_solutions.sql`

---

## Learning Outcome

After completing this phase, you will be able to:

- Write clean and maintainable SQL queries using CTEs
- Replace complex nested subqueries with CTEs
- Build recursive queries for hierarchical data
- Combine CTEs with joins, aggregates, and window functions
- Apply SQL best practices in real-world scenarios

---

**Previous Phase:** Phase 08 – Window Functions

**Next Phase:** Phase 10 – Stored Procedures & Functions