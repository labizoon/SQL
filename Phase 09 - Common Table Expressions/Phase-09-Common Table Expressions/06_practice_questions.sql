/*
=========================================================
SQL COMMON TABLE EXPRESSIONS (CTEs)
PRACTICE QUESTIONS
=========================================================

Instructions:
Write SQL queries using Common Table Expressions
(CTEs) to solve the following problems.

Topics Covered:
- Basic CTE
- Multiple CTEs
- Recursive CTE
- CTE with JOIN
- CTE with Aggregate Functions
- CTE with Window Functions
*/


-- =====================================================
-- BASIC CTE
-- =====================================================

-- Q1
-- Display employees whose salary is greater than
-- the average salary using a CTE.



-- Q2
-- Display employees hired after '2023-01-01'
-- using a CTE.



-- Q3
-- Display all active employees using a CTE.



-- =====================================================
-- AGGREGATE CTE
-- =====================================================

-- Q4
-- Find the average salary of each department
-- using a CTE.



-- Q5
-- Find departments having an average salary
-- greater than 60000 using a CTE.



-- =====================================================
-- MULTIPLE CTEs
-- =====================================================

-- Q6
-- Create one CTE for department averages and
-- another CTE to display employees earning
-- above their department average.



-- Q7
-- Create one CTE for recent employees and
-- another CTE to rank them by salary.



-- =====================================================
-- CTE + WINDOW FUNCTIONS
-- =====================================================

-- Q8
-- Use ROW_NUMBER() inside a CTE to display
-- the top 5 highest-paid employees.



-- Q9
-- Use DENSE_RANK() inside a CTE to find
-- the top 3 salary ranks.



-- =====================================================
-- CTE + JOIN
-- =====================================================

-- Q10
-- Use a CTE to display employee names along
-- with their department names.



-- Q11
-- Display employees working in departments
-- located in 'New York' using one or more CTEs.



-- =====================================================
-- RECURSIVE CTE
-- =====================================================

-- Q12
-- Generate numbers from 1 to 20
-- using a recursive CTE.



-- Q13
-- Generate dates from
-- '2025-01-01' to '2025-01-15'
-- using a recursive CTE.



-- Q14
-- Display the employee-manager hierarchy
-- using a recursive CTE.



-- =====================================================
-- MIXED QUESTIONS
-- =====================================================

-- Q15
-- Display the top 3 highest-paid employees
-- in each department using a CTE.



-- Q16
-- Display departments with more than
-- 5 employees using a CTE.



-- Q17
-- Display employees earning more than
-- the company average salary.



-- Q18
-- Display employees along with the
-- company average salary.



-- =====================================================
-- CHALLENGE QUESTIONS
-- =====================================================

-- Challenge 1
-- Find the second highest salary using a CTE.



-- Challenge 2
-- Display each employee with:
-- • Salary Rank
-- • Running Salary Total
-- • Previous Salary
-- using one CTE.



-- Challenge 3
-- Display departments ranked by
-- average salary.



-- Challenge 4
-- Generate numbers from 1 to 100
-- using a recursive CTE.



-- Challenge 5
-- Build a complete reporting hierarchy
-- showing the reporting path for every employee.