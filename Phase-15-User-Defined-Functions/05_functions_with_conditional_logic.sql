-- ============================================
-- Phase 15 - User-Defined Functions
-- File: 05_functions_with_conditional_logic.sql
-- Topic: Conditional Logic in Functions
-- ============================================


-- 1. Categorize salary

DELIMITER //

CREATE FUNCTION salary_category(
    salary DECIMAL(10,2)
)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN

    IF salary >= 150000 THEN
        RETURN 'High Salary';

    ELSEIF salary >= 80000 THEN
        RETURN 'Medium Salary';

    ELSE
        RETURN 'Low Salary';

    END IF;

END //

DELIMITER ;


-- Test

SELECT salary_category(200000);

SELECT salary_category(100000);

SELECT salary_category(50000);


-- 2. Use with employees table

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary_category(salary) AS salary_category
FROM employees;


-- 3. Drop function

DROP FUNCTION salary_category;