# Phase 12 – SQL Stored Procedures

## Overview

This phase covers **SQL Stored Procedures**, one of the most powerful features of relational databases. A stored procedure is a precompiled collection of SQL statements stored in the database that can be executed whenever needed.

Stored procedures help reduce code duplication, improve performance, increase security, and make database applications easier to maintain.

---

## Learning Objectives

After completing this phase, you will be able to:

- Understand what stored procedures are
- Create and execute stored procedures
- Use `IN`, `OUT`, and `INOUT` parameters
- Implement conditional logic with `IF`, `ELSEIF`, and `ELSE`
- Use loops (`WHILE`, `REPEAT`, and `LOOP`)
- Handle errors using SQL handlers
- Apply stored procedure best practices
- Solve interview-style stored procedure problems

---

## Topics Covered

- Creating Stored Procedures
- Calling Stored Procedures
- IN, OUT, and INOUT Parameters
- IF, ELSEIF, and ELSE Statements
- WHILE, REPEAT, and LOOP
- Error Handling
- Best Practices
- Practice Questions
- Solutions

---

## Folder Structure

```text
Phase-12-Stored-Procedures/
│
├── 01_create_procedure.sql
├── 02_parameters.sql
├── 03_if_else.sql
├── 04_loops.sql
├── 05_error_handling.sql
├── 06_best_practices.sql
├── 07_practice_questions.sql
├── 08_solutions.sql
├── sample_data.sql
└── README.md
```

---

## File Descriptions

### 01_create_procedure.sql
- Introduction to stored procedures
- Creating procedures
- Executing procedures with `CALL`
- Multiple practical examples

### 02_parameters.sql
- `IN` parameters
- `OUT` parameters
- `INOUT` parameters
- Passing and returning values

### 03_if_else.sql
- Conditional statements
- `IF`
- `ELSEIF`
- `ELSE`
- Nested conditions

### 04_loops.sql
- `WHILE`
- `REPEAT`
- `LOOP`
- `LEAVE`
- `ITERATE`
- Loop control examples

### 05_error_handling.sql
- `DECLARE HANDLER`
- `EXIT HANDLER`
- `CONTINUE HANDLER`
- `SIGNAL`
- Transactions and `ROLLBACK`

### 06_best_practices.sql
- Procedure naming
- Input validation
- Transactions
- Performance tips
- Common mistakes

### 07_practice_questions.sql
- Practice exercises covering all stored procedure concepts
- Challenge questions

### 08_solutions.sql
- Complete solutions for all practice questions

---

## Requirements

The examples in this phase are written for:

- **MySQL 8.0+**

> **Note:** Other database systems such as PostgreSQL, SQL Server, and Oracle also support stored procedures, but the syntax differs.

---

## Basic Syntax

### Create a Procedure

```sql
DELIMITER //

CREATE PROCEDURE GetAllEmployees()
BEGIN

    SELECT *
    FROM employees;

END //

DELIMITER ;
```

### Execute a Procedure

```sql
CALL GetAllEmployees();
```

### Procedure with an IN Parameter

```sql
CREATE PROCEDURE GetEmployeesByDepartment
(
    IN dept_id INT
)
BEGIN

    SELECT *
    FROM employees
    WHERE department_id = dept_id;

END;
```

### Procedure with an OUT Parameter

```sql
CREATE PROCEDURE GetEmployeeCount
(
    OUT total INT
)
BEGIN

    SELECT COUNT(*)
    INTO total
    FROM employees;

END;
```

---

## Advantages of Stored Procedures

- Reusable SQL code
- Improved performance through precompiled execution
- Better security by limiting direct table access
- Easier maintenance
- Reduced network traffic between application and database
- Centralized business logic

---

## Limitations

- Database-specific syntax
- Can become difficult to debug
- Large procedures are harder to maintain
- May reduce portability between database systems

---

## Best Practices

- Use meaningful procedure names.
- Keep each procedure focused on a single task.
- Use parameters instead of hardcoded values.
- Validate input values before processing.
- Handle errors appropriately.
- Use transactions for critical operations.
- Avoid `SELECT *` in production procedures.
- Document complex business logic with comments.
- Test procedures with valid and invalid inputs.

---

## Common Use Cases

- Employee management
- Payroll processing
- Order processing
- Inventory management
- Banking transactions
- Report generation
- Data validation
- Automated business workflows

---

## Practice

Complete all exercises in:

- `07_practice_questions.sql`

Then compare your answers with:

- `08_solutions.sql`

---

## Learning Outcome

After completing this phase, you will be able to:

- Create and execute stored procedures
- Pass values using `IN`, `OUT`, and `INOUT` parameters
- Build decision-making logic with `IF` statements
- Use loops for repetitive tasks
- Handle runtime errors effectively
- Write clean, reusable, and maintainable database programs

---



