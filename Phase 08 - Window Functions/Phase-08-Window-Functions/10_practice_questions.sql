/*
=========================================================
SQL WINDOW FUNCTIONS - PRACTICE QUESTIONS
=========================================================

Instructions:
Write SQL queries using the appropriate
window function.

Topics Covered:
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- NTILE()
- LEAD()
- LAG()
- FIRST_VALUE()
- LAST_VALUE()
- NTH_VALUE()
- Running Total
- Moving Average
*/


-- =====================================================
-- ROW_NUMBER()
-- =====================================================

-- Q1
-- Display employees with a row number
-- based on salary (highest to lowest).



-- Q2
-- Assign row numbers within each department
-- ordered by hire date.



-- =====================================================
-- RANK()
-- =====================================================

-- Q3
-- Rank employees by salary.



-- Q4
-- Rank employees within each department
-- based on salary.



-- =====================================================
-- DENSE_RANK()
-- =====================================================

-- Q5
-- Assign dense ranks based on salary.



-- Q6
-- Find the top 3 salary ranks
-- using DENSE_RANK().



-- =====================================================
-- NTILE()
-- =====================================================

-- Q7
-- Divide employees into four salary groups.



-- Q8
-- Divide customers into five spending groups.



-- =====================================================
-- LEAD() & LAG()
-- =====================================================

-- Q9
-- Display the previous employee salary.



-- Q10
-- Display the next employee salary.



-- Q11
-- Calculate the salary difference
-- from the previous employee.



-- =====================================================
-- FIRST_VALUE()
-- =====================================================

-- Q12
-- Display the lowest salary
-- in the company.



-- =====================================================
-- LAST_VALUE()
-- =====================================================

-- Q13
-- Display the highest salary
-- in the company.



-- =====================================================
-- NTH_VALUE()
-- =====================================================

-- Q14
-- Display the second highest salary.



-- =====================================================
-- RUNNING TOTAL
-- =====================================================

-- Q15
-- Calculate the running total of salaries.



-- Q16
-- Calculate the running total
-- within each department.



-- =====================================================
-- MOVING AVERAGE
-- =====================================================

-- Q17
-- Calculate a 3-row moving average
-- of employee salaries.



-- Q18
-- Calculate a 5-day moving average
-- of sales.



-- =====================================================
-- MIXED QUESTIONS
-- =====================================================

-- Q19
-- Find the highest-paid employee
-- in each department.



-- Q20
-- Display each employee along with:
-- • Salary Rank
-- • Previous Salary
-- • Running Salary Total



/*
=========================================================
CHALLENGE QUESTIONS
=========================================================
*/

-- Challenge 1
-- Display the top 5 highest-paid employees
-- using ROW_NUMBER().



-- Challenge 2
-- Find the employee(s) with the
-- second-highest salary using DENSE_RANK().



-- Challenge 3
-- Divide employees into salary quartiles
-- using NTILE().



-- Challenge 4
-- Calculate month-over-month sales growth
-- using LAG().



-- Challenge 5
-- Display the running total and moving average
-- of monthly sales in a single query.