-- ============================================
-- Phase 15 - User-Defined Functions
-- File: 03_functions_with_parameters.sql
-- Topic: Functions with Parameters
-- ============================================


-- 1. Function with one parameter

DELIMITER //

CREATE FUNCTION calculate_annual_salary(
    monthly_salary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END //

DELIMITER ;


-- Test with different values

SELECT calculate_annual_salary(50000);

SELECT calculate_annual_salary(80000);

SELECT calculate_annual_salary(100000);


-- 2. Function to calculate salary after tax

DELIMITER //

CREATE FUNCTION salary_after_tax(
    salary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN salary - (salary * 0.10);
END //

DELIMITER ;


-- Test

SELECT salary_after_tax(100000);


-- 3. Function with a percentage parameter

DELIMITER //

CREATE FUNCTION calculate_percentage(
    amount DECIMAL(10,2),
    percentage DECIMAL(5,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN amount * (percentage / 100);
END //

DELIMITER ;


-- Test

SELECT calculate_percentage(100000, 10);

SELECT calculate_percentage(100000, 20);

SELECT calculate_percentage(50000, 15);


-- 4. Use a parameterized function with table data

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    calculate_annual_salary(salary) AS annual_salary
FROM employees;


-- 5. Drop functions

DROP FUNCTION calculate_annual_salary;

DROP FUNCTION salary_after_tax;

DROP FUNCTION calculate_percentage;