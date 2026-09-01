-- ============================================
-- Phase 15 - User-Defined Functions
-- File: 06_functions_with_variables.sql
-- Topic: Variables Inside Functions
-- ============================================


-- 1. Calculate salary after tax using a variable

DELIMITER //

CREATE FUNCTION calculate_net_salary(
    salary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN

    DECLARE tax DECIMAL(12,2);
    DECLARE net_salary DECIMAL(12,2);

    SET tax = salary * 0.10;

    SET net_salary = salary - tax;

    RETURN net_salary;

END //

DELIMITER ;


-- Test

SELECT calculate_net_salary(100000);

SELECT calculate_net_salary(150000);


-- 2. Calculate annual salary using a variable

DELIMITER //

CREATE FUNCTION calculate_annual_salary_with_variable(
    monthly_salary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN

    DECLARE annual_salary DECIMAL(12,2);

    SET annual_salary = monthly_salary * 12;

    RETURN annual_salary;

END //

DELIMITER ;


-- Test

SELECT calculate_annual_salary_with_variable(100000);


-- 3. Use with employees

SELECT
    employee_id,
    first_name,
    salary,
    calculate_net_salary(salary) AS net_salary
FROM employees;


-- 4. Drop functions

DROP FUNCTION calculate_net_salary;

DROP FUNCTION calculate_annual_salary_with_variable;