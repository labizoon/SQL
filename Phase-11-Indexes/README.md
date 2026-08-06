# Phase 11 – SQL Indexes

## Overview

This phase covers **SQL Indexes**, one of the most important database optimization techniques used to improve query performance.

An **Index** is a database object that helps the database locate rows more efficiently without scanning the entire table. Indexes significantly improve the performance of `SELECT`, `WHERE`, `JOIN`, `ORDER BY`, and `GROUP BY` operations.

However, indexes also require additional storage space and can slow down `INSERT`, `UPDATE`, and `DELETE` operations because the indexes must be updated whenever the data changes.

---

## Learning Objectives

After completing this phase, you will be able to:

- Understand what an index is
- Create and remove indexes
- Create unique indexes
- Build composite (multi-column) indexes
- Compare indexes with primary keys
- Follow indexing best practices
- Improve SQL query performance
- Solve interview-style index questions

---

## Topics Covered

- Creating Indexes
- Unique Indexes
- Dropping Indexes
- Composite Indexes
- Index vs Primary Key
- Best Practices
- Practice Questions
- Solutions

---

## Folder Structure

```text
Phase-11-Indexes/
│
├── 01_create_index.sql
├── 02_unique_index.sql
├── 03_drop_index.sql
├── 04_composite_index.sql
├── 05_index_vs_primary_key.sql
├── 06_best_practices.sql
├── 07_practice_questions.sql
├── 08_solutions.sql
└── README.md
```

---

## File Descriptions

### 01_create_index.sql
- Introduction to indexes
- CREATE INDEX syntax
- Indexes for `WHERE`, `JOIN`, and `ORDER BY`
- Advantages and disadvantages

### 02_unique_index.sql
- UNIQUE INDEX syntax
- Preventing duplicate values
- Single-column and composite unique indexes
- Real-world examples

### 03_drop_index.sql
- DROP INDEX syntax
- Removing indexes
- Viewing existing indexes
- Index maintenance

### 04_composite_index.sql
- Multi-column indexes
- Column order
- Leftmost prefix principle
- Query optimization

### 05_index_vs_primary_key.sql
- Differences between indexes and primary keys
- Automatic indexing
- Unique indexes
- Real-world comparisons

### 06_best_practices.sql
- Index design guidelines
- Performance optimization
- Common mistakes
- Maintenance tips

### 07_practice_questions.sql
- Practice exercises covering all index concepts
- Challenge questions

### 08_solutions.sql
- Complete solutions for all practice questions

---

## Requirements

The examples are compatible with:

- MySQL 8.0+
- PostgreSQL (minor syntax differences)
- SQL Server (minor syntax differences)
- Oracle (minor syntax differences)

---

## Basic Syntax

### Create an Index

```sql
CREATE INDEX idx_employee_salary
ON employees(salary);
```

### Create a Unique Index

```sql
CREATE UNIQUE INDEX idx_employee_email
ON employees(email);
```

### Create a Composite Index

```sql
CREATE INDEX idx_department_salary
ON employees(department_id, salary);
```

### Drop an Index

```sql
DROP INDEX idx_employee_salary
ON employees;
```

### View Existing Indexes (MySQL)

```sql
SHOW INDEX
FROM employees;
```

---

## Advantages of Indexes

- Improve query performance
- Speed up `WHERE` conditions
- Improve `JOIN` operations
- Improve `ORDER BY` queries
- Improve `GROUP BY` queries
- Reduce query execution time on large tables

---

## Disadvantages of Indexes

- Require additional storage
- Slow down `INSERT` operations
- Slow down `UPDATE` operations
- Slow down `DELETE` operations
- Too many indexes can reduce overall performance

---

## Best Practices

- Index columns frequently used in `WHERE` clauses.
- Index foreign keys used in `JOIN` operations.
- Use composite indexes for common multi-column searches.
- Avoid indexing every column.
- Avoid indexing very small tables.
- Use meaningful index names.
- Monitor query performance regularly.
- Remove unused or duplicate indexes.

---

## Common Use Cases

- Employee lookup by email
- Searching customers by last name
- Joining employees with departments
- Sorting records by hire date
- Filtering orders by customer and date

---

## Practice

Complete all exercises in:

- `07_practice_questions.sql`

Then compare your answers with:

- `08_solutions.sql`

---

## Learning Outcome

After completing this phase, you will be able to:

- Create and manage SQL indexes
- Optimize database queries
- Design efficient composite indexes
- Compare indexes with primary keys
- Apply indexing best practices in real-world databases
- Improve SQL performance for large datasets

---

## Previous Phase

**Phase 10 – Views**

## Next Phase

**Phase 12 – Stored Procedures**