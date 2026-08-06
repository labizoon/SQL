/*
=========================================================
SQL VIEWS
PRACTICE QUESTIONS
=========================================================

Instructions:
Write SQL queries to solve the following problems
using SQL Views.

Topics Covered:

• CREATE VIEW
• UPDATE VIEW
• DROP VIEW
• Complex Views
• Aggregate Views
• JOIN Views
• Best Practices
*/


-- =====================================================
-- BASIC VIEWS
-- =====================================================

-- Q1
-- Create a view that displays:
-- employee_id, first_name, last_name and salary.



-- Q2
-- Create a view showing only employees
-- whose salary is greater than 60000.



-- Q3
-- Create a view that displays only
-- active employees.



-- =====================================================
-- VIEW WITH FILTERS
-- =====================================================

-- Q4
-- Create a view that shows employees
-- from department 2.



-- Q5
-- Create a view that displays employees
-- hired after '2023-01-01'.



-- =====================================================
-- VIEW WITH JOIN
-- =====================================================

-- Q6
-- Create a view displaying employee names
-- and their department names.



-- Q7
-- Create a view displaying employee names,
-- department names and salaries.



-- =====================================================
-- AGGREGATE VIEWS
-- =====================================================

-- Q8
-- Create a view showing the average salary
-- for each department.



-- Q9
-- Create a view showing:

-- Department Name
-- Total Employees
-- Average Salary



-- =====================================================
-- CALCULATED COLUMNS
-- =====================================================

-- Q10
-- Create a view displaying:

-- Full Name
-- Salary
-- Annual Salary (salary × 12)



-- =====================================================
-- UPDATE VIEWS
-- =====================================================

-- Q11
-- Modify an existing employee view
-- to include department_id.



-- Q12
-- Modify a view so it only displays
-- employees earning above 70000.



-- =====================================================
-- DROP VIEWS
-- =====================================================

-- Q13
-- Drop the view employee_details.



-- Q14
-- Drop the view safely using IF EXISTS.



-- =====================================================
-- COMPARISON QUESTIONS
-- =====================================================

-- Q15
-- Which object stores data?

-- a) View
-- b) Table



-- Q16
-- Which object automatically reflects
-- changes made to the base table?

-- a) View
-- b) Backup Table



-- =====================================================
-- CHALLENGE QUESTIONS
-- =====================================================

-- Challenge 1
-- Create a view showing the top
-- 5 highest-paid employees.



-- Challenge 2
-- Create a view showing employees
-- whose salary is above the company
-- average salary.



-- Challenge 3
-- Create a view displaying:

-- Department Name
-- Highest Salary
-- Lowest Salary
-- Average Salary



-- Challenge 4
-- Create a secure public employee view
-- that hides salary and personal details.



-- Challenge 5
-- Create a reporting view combining:

-- Employee Name
-- Department Name
-- Salary
-- Salary Category

-- (High / Medium / Low)