-- ============================================
-- Phase 15 - User-Defined Functions
-- File: 01_basic_functions.sql
-- Topic: Basic User-Defined Functions
-- ============================================


-- 1. Create a simple function
-- This function returns a fixed message.

DELIMITER //

CREATE FUNCTION hello_sql()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    RETURN 'Hello from SQL Functions!';
END //

DELIMITER ;


-- 2. Call the function

SELECT hello_sql();


-- 3. Function returning a number

DELIMITER //

CREATE FUNCTION get_company_year()
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN 2026;
END //

DELIMITER ;


-- 4. Call the function

SELECT get_company_year();


-- 5. Drop a function

DROP FUNCTION hello_sql;

DROP FUNCTION get_company_year;