-- ============================================
-- Phase 15 - User-Defined Functions
-- File: 04_functions_with_multiple_parameters.sql
-- Topic: Functions with Multiple Parameters
-- ============================================


-- 1. Function with two parameters

DELIMITER //

CREATE FUNCTION calculate_bonus(
    salary DECIMAL(10,2),
    bonus_percentage DECIMAL(5,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN salary * (bonus_percentage / 100);
END //

DELIMITER ;


-- Test the function

SELECT calculate_bonus(100000, 10);

SELECT calculate_bonus(80000, 15);

SELECT calculate_bonus(120000, 20);


-- 2. Function with three parameters

DELIMITER //

CREATE FUNCTION calculate_final_salary(
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    deduction DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN salary + bonus - deduction;
END //

DELIMITER ;


-- Test

SELECT calculate_final_salary(
    100000,
    15000,
    5000
);


-- 3. Function using employee-related values

DELIMITER //

CREATE FUNCTION calculate_net_salary(
    salary DECIMAL(10,2),
    tax_percentage DECIMAL(5,2),
    allowance DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN salary
           - (salary * tax_percentage / 100)
           + allowance;
END //

DELIMITER ;


-- Test

SELECT calculate_net_salary(
    100000,
    10,
    15000
);


-- 4. Use the function with employee table data

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    calculate_net_salary(
        salary,
        10,
        15000
    ) AS estimated_net_salary
FROM employees;


-- 5. Drop functions

DROP FUNCTION calculate_bonus;

DROP FUNCTION calculate_final_salary;

DROP FUNCTION calculate_net_salary;