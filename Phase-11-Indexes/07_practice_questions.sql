/*
=========================================================
SQL INDEXES
PRACTICE QUESTIONS
=========================================================

Instructions:
Write SQL queries to solve the following problems
using SQL Indexes.

Topics Covered:

• CREATE INDEX
• UNIQUE INDEX
• DROP INDEX
• COMPOSITE INDEX
• INDEX vs PRIMARY KEY
• Best Practices
*/


-- =====================================================
-- BASIC INDEXES
-- =====================================================

-- Q1
-- Create an index on the first_name column
-- of the employees table.



-- Q2
-- Create an index on the salary column.



-- Q3
-- Create an index on the hire_date column.



-- =====================================================
-- UNIQUE INDEXES
-- =====================================================

-- Q4
-- Create a unique index on the email column.



-- Q5
-- Create a unique index on the username column.



-- =====================================================
-- COMPOSITE INDEXES
-- =====================================================

-- Q6
-- Create a composite index on:

-- department_id
-- salary



-- Q7
-- Create a composite index on:

-- customer_id
-- order_date



-- =====================================================
-- DROP INDEX
-- =====================================================

-- Q8
-- Drop the index idx_employee_salary.



-- Q9
-- Drop the index idx_employee_email.



-- =====================================================
-- QUERY ANALYSIS
-- =====================================================

-- Q10
-- Which column should be indexed to improve
-- this query?

SELECT *
FROM employees
WHERE department_id = 3;



-- Q11
-- Which column should be indexed to improve
-- this JOIN?

SELECT
    e.first_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;



-- =====================================================
-- CONCEPT QUESTIONS
-- =====================================================

-- Q12
-- Which object guarantees uniqueness?

-- a) Normal Index

-- b) Unique Index



-- Q13
-- Which object automatically creates an index?

-- a) Primary Key

-- b) Foreign Key



-- =====================================================
-- CHALLENGE QUESTIONS
-- =====================================================

-- Challenge 1
-- Create indexes to optimize a query that:

-- Filters by department_id

-- Sorts by hire_date



-- Challenge 2
-- Create an index for searching
-- customers by last_name.



-- Challenge 3
-- Create a composite index for an orders
-- table using:

-- customer_id

-- order_date

-- total_amount



-- Challenge 4
-- Write SQL to display all indexes
-- on the employees table.



-- Challenge 5
-- Explain why too many indexes can
-- reduce database performance.