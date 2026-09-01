-- ============================================
-- Phase 15 - User-Defined Functions
-- File: 02_scalar_functions.sql
-- Topic: Scalar Functions
-- ============================================


-- 1. Function to calculate annual salary

DELIMITER //

CREATE FUNCTION calculate_annual_salary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END //

DELIMITER ;


-- Test the function

SELECT calculate_annual_salary(100000);


-- 2. Function to calculate a 10% bonus

DELIMITER //

CREATE FUNCTION calculate_bonus(salary DECIMAL(10,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END //

DELIMITER ;


-- Test the function

SELECT calculate_bonus(100000);


-- 3. Use the function with a SELECT statement

SELECT
    100000 AS monthly_salary,
    calculate_annual_salary(100000) AS annual_salary,
    calculate_bonus(100000) AS bonus;


-- 4. Use the function with table data
-- Assuming your employees table contains a salary column.

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    calculate_annual_salary(salary) AS annual_salary,
    calculate_bonus(salary) AS bonus
FROM employees;


-- 5. Drop functions

DROP FUNCTION calculate_annual_salary;

DROP FUNCTION calculate_bonus;