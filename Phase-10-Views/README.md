# Phase 10 – SQL Views

## Overview

This phase covers **SQL Views**, a powerful database feature used to simplify complex queries, improve security, and create reusable virtual tables.

A **View** is a virtual table based on the result of a SQL query. Unlike a regular table, a view does **not** store data itself. Instead, it stores the SQL query and retrieves the latest data from the underlying table whenever it is queried.

Views are widely used in reporting systems, dashboards, business intelligence (BI), and enterprise applications.

---

## Learning Objectives

After completing this phase, you will be able to:

- Understand what a View is
- Create simple and complex views
- Modify existing views
- Delete views
- Build views using JOINs
- Create aggregate views
- Compare Views and Tables
- Apply view best practices
- Solve practical interview-style questions

---

## Topics Covered

- Creating Views
- Updating Views
- Dropping Views
- Complex Views
- View vs Table
- Best Practices
- Practice Questions
- Solutions

---

## Folder Structure

```text
Phase-10-Views/
│
├── 01_create_view.sql
├── 02_update_view.sql
├── 03_drop_view.sql
├── 04_complex_views.sql
├── 05_view_vs_table.sql
├── 06_best_practices.sql
├── 07_practice_questions.sql
├── 08_solutions.sql
├── sample_data.sql
└── README.md
```

---

## File Descriptions

### 01_create_view.sql
- Introduction to SQL Views
- CREATE VIEW syntax
- Simple views
- Views with filtering
- Views with JOINs
- Aggregate views

### 02_update_view.sql
- CREATE OR REPLACE VIEW
- ALTER VIEW
- Updating existing views
- Updatable vs non-updatable views

### 03_drop_view.sql
- DROP VIEW
- DROP VIEW IF EXISTS
- Removing multiple views
- Best practices for deleting views

### 04_complex_views.sql
- Complex views
- JOINs
- Aggregate functions
- GROUP BY
- CASE expressions
- Reporting views

### 05_view_vs_table.sql
- Differences between tables and views
- Storage comparison
- Performance comparison
- Real-world usage

### 06_best_practices.sql
- Naming conventions
- Security
- Performance tips
- Common mistakes
- Professional recommendations

### 07_practice_questions.sql
- Practice exercises covering all View concepts
- Challenge questions

### 08_solutions.sql
- Complete solutions for all practice questions

---

## Requirements

The examples are compatible with:

- MySQL 8.0+
- PostgreSQL (minor syntax changes may be required)
- SQL Server (replace `LIMIT` with `TOP`)
- Oracle (minor syntax changes may be required)

---

## Basic Syntax

### Create a View

```sql
CREATE VIEW employee_details AS
SELECT
    employee_id,
    first_name,
    salary
FROM employees;
```

### Query a View

```sql
SELECT *
FROM employee_details;
```

### Update a View

```sql
CREATE OR REPLACE VIEW employee_details AS
SELECT
    employee_id,
    first_name,
    department_id,
    salary
FROM employees;
```

### Drop a View

```sql
DROP VIEW employee_details;
```

---

## Advantages of Views

- Simplify complex SQL queries
- Improve code reusability
- Hide sensitive data
- Provide consistent reports
- Improve database security
- Always display the latest data

---

## Limitations

- Views do not store data.
- Some views cannot be updated.
- Complex views may affect query performance.
- Views depend on the underlying tables.

---

## Best Practices

- Use meaningful view names.
- Select only the required columns.
- Avoid using `SELECT *`.
- Keep views simple and readable.
- Use views to improve security.
- Document the purpose of each view.
- Remove unused views regularly.

---

## Practice

Complete all exercises in:

- `07_practice_questions.sql`

Then compare your answers with:

- `08_solutions.sql`

---

## Learning Outcome

After completing this phase, you will be able to:

- Create and manage SQL Views
- Build reusable virtual tables
- Create reporting and dashboard views
- Secure data using views
- Compare views with tables
- Apply SQL View best practices in real-world projects

---

## Previous Phase

**Phase 09 – Common Table Expressions (CTEs)**

## Next Phase

**Phase 11 – Indexes**