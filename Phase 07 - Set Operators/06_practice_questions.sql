/*
=========================================================
SQL SET OPERATORS - PRACTICE QUESTIONS
=========================================================

Instructions:
Write SQL queries using the appropriate set operator.

Use:
- UNION
- UNION ALL
- INTERSECT
- EXCEPT (or MINUS in Oracle)

=========================================================
*/


-- ==========================================
-- UNION
-- ==========================================

-- Q1
-- Display employees from Department 1 and Department 2.

-- Your Query Here



-- Q2
-- Display employees earning more than 70,000
-- or hired after 2024.

-- Your Query Here



-- Q3
-- Display all unique employee and manager IDs.

-- Your Query Here



-- Q4
-- Display employee names from Sales and HR departments.

-- Your Query Here



-- Q5
-- Display all unique department IDs from
-- employees and departments tables.

-- Your Query Here




-- ==========================================
-- UNION ALL
-- ==========================================

-- Q6
-- Display employees from Department 1 and 2,
-- including duplicate rows.

-- Your Query Here



-- Q7
-- Display employees earning above 60,000
-- or working in Department 3.
-- Keep duplicates.

-- Your Query Here



-- Q8
-- Combine employee IDs and manager IDs
-- including duplicates.

-- Your Query Here



-- Q9
-- Display all first names from employees
-- and managers.

-- Your Query Here



-- Q10
-- Display department IDs from employees
-- and departments including duplicates.

-- Your Query Here




-- ==========================================
-- INTERSECT
-- ==========================================

-- Q11
-- Display employees who earn more than 60,000
-- and belong to Department 1.

-- Your Query Here



-- Q12
-- Display employees hired after 2024
-- and currently Active.

-- Your Query Here



-- Q13
-- Display employees who are also managers.

-- Your Query Here



-- Q14
-- Display department IDs having employees
-- with salary above 70,000 and hired after 2024.

-- Your Query Here



-- Q15
-- Display employee names that appear
-- in both result sets.

-- Your Query Here




-- ==========================================
-- EXCEPT
-- ==========================================

-- Q16
-- Display employees who are not managers.

-- Your Query Here



-- Q17
-- Display employees earning above 60,000
-- but not hired after 2024.

-- Your Query Here



-- Q18
-- Display Department 1 employees
-- excluding Department 2 employees.

-- Your Query Here



-- Q19
-- Display department IDs that do not have
-- employees hired after 2024.

-- Your Query Here



-- Q20
-- Display employee names in Department 1
-- excluding employees earning above 50,000.

-- Your Query Here;



/*
=========================================================
Challenge Questions
=========================================================
*/

-- Challenge 1
-- Combine employee IDs from employees,
-- retired_employees, and contract_employees
-- into one result without duplicates.



-- Challenge 2
-- Display employees who satisfy BOTH:
-- Salary > 80,000
-- Hired after 2023.



-- Challenge 3
-- Display all employees except managers.



-- Challenge 4
-- Combine names from employees,
-- managers, and applicants.



-- Challenge 5
-- Which set operator is the fastest
-- when duplicate removal is not required?