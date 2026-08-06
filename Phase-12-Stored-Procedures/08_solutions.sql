/*
=========================================================
SQL STORED PROCEDURES
SOLUTIONS
=========================================================
*/


-- =====================================================
-- Solution 1
-- Display All Employees
-- =====================================================

DELIMITER //

CREATE PROCEDURE GetAllEmployees()
BEGIN

    SELECT *
    FROM employees;

END //

DELIMITER ;



-- =====================================================
-- Solution 2
-- Display Employee Details
-- =====================================================

DELIMITER //

CREATE PROCEDURE GetEmployeeDetails()
BEGIN

    SELECT
        employee_id,
        first_name,
        salary
    FROM employees;

END //

DELIMITER ;



-- =====================================================
-- Solution 3
-- Employees by Department
-- =====================================================

DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment
(
    IN dept_id INT
)
BEGIN

    SELECT *
    FROM employees
    WHERE department_id = dept_id;

END //

DELIMITER ;



-- =====================================================
-- Solution 4
-- Employees by Minimum Salary
-- =====================================================

DELIMITER //

CREATE PROCEDURE GetEmployeesBySalary
(
    IN minimum_salary DECIMAL(10,2)
)
BEGIN

    SELECT *
    FROM employees
    WHERE salary >= minimum_salary;

END //

DELIMITER ;



-- =====================================================
-- Solution 5
-- Total Employee Count
-- =====================================================

DELIMITER //

CREATE PROCEDURE GetEmployeeCount
(
    OUT total_employees INT
)
BEGIN

    SELECT COUNT(*)
    INTO total_employees
    FROM employees;

END //

DELIMITER ;



-- =====================================================
-- Solution 6
-- Average Salary
-- =====================================================

DELIMITER //

CREATE PROCEDURE GetAverageSalary
(
    OUT average_salary DECIMAL(10,2)
)
BEGIN

    SELECT AVG(salary)
    INTO average_salary
    FROM employees;

END //

DELIMITER ;



-- =====================================================
-- Solution 7
-- Increase Salary by 10%
-- =====================================================

DELIMITER //

CREATE PROCEDURE IncreaseSalary
(
    INOUT employee_salary DECIMAL(10,2)
)
BEGIN

    SET employee_salary = employee_salary * 1.10;

END //

DELIMITER ;



-- =====================================================
-- Solution 8
-- Salary Classification
-- =====================================================

DELIMITER //

CREATE PROCEDURE CheckSalary
(
    IN employee_salary DECIMAL(10,2)
)
BEGIN

    IF employee_salary >= 80000 THEN

        SELECT 'High Salary' AS salary_level;

    ELSEIF employee_salary >= 50000 THEN

        SELECT 'Medium Salary' AS salary_level;

    ELSE

        SELECT 'Low Salary' AS salary_level;

    END IF;

END //

DELIMITER ;



-- =====================================================
-- Solution 9
-- Bonus Eligibility
-- =====================================================

DELIMITER //

CREATE PROCEDURE BonusEligibility
(
    IN employee_salary DECIMAL(10,2)
)
BEGIN

    IF employee_salary >= 70000 THEN

        SELECT 'Eligible for Bonus' AS result;

    ELSE

        SELECT 'Not Eligible for Bonus' AS result;

    END IF;

END //

DELIMITER ;



-- =====================================================
-- Solution 10
-- WHILE Loop
-- =====================================================

DELIMITER //

CREATE PROCEDURE PrintNumbers()
BEGIN

    DECLARE counter INT DEFAULT 1;

    WHILE counter <= 10 DO

        SELECT counter AS number;

        SET counter = counter + 1;

    END WHILE;

END //

DELIMITER ;



-- =====================================================
-- Solution 11
-- REPEAT Loop
-- =====================================================

DELIMITER //

CREATE PROCEDURE Countdown()
BEGIN

    DECLARE counter INT DEFAULT 5;

    REPEAT

        SELECT counter AS number;

        SET counter = counter - 1;

    UNTIL counter = 0

    END REPEAT;

END //

DELIMITER ;



-- =====================================================
-- Solution 12
-- LOOP Statement
-- =====================================================

DELIMITER //

CREATE PROCEDURE LoopExample()
BEGIN

    DECLARE counter INT DEFAULT 1;

    my_loop: LOOP

        IF counter > 20 THEN
            LEAVE my_loop;
        END IF;

        SELECT counter AS number;

        SET counter = counter + 1;

    END LOOP my_loop;

END //

DELIMITER ;



-- =====================================================
-- Solution 13
-- EXIT HANDLER
-- =====================================================

DELIMITER //

CREATE PROCEDURE ExitHandlerExample()
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'An SQL error occurred.' AS message;
    END;

    SELECT *
    FROM employees;

END //

DELIMITER ;



-- =====================================================
-- Solution 14
-- Raise Custom Error
-- =====================================================

DELIMITER //

CREATE PROCEDURE ValidateSalary
(
    IN employee_salary DECIMAL(10,2)
)
BEGIN

    IF employee_salary < 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative.';

    ELSE

        SELECT 'Salary is valid.' AS message;

    END IF;

END //

DELIMITER ;



-- =====================================================
-- Challenge Solution 1
-- Employee Details by ID
-- =====================================================

DELIMITER //

CREATE PROCEDURE GetEmployeeById
(
    IN emp_id INT
)
BEGIN

    SELECT *
    FROM employees
    WHERE employee_id = emp_id;

END //

DELIMITER ;



-- =====================================================
-- Challenge Solution 2
-- Highest Salary
-- =====================================================

DELIMITER //

CREATE PROCEDURE GetHighestSalary()
BEGIN

    SELECT MAX(salary) AS highest_salary
    FROM employees;

END //

DELIMITER ;



-- =====================================================
-- Challenge Solution 3
-- Update Salary in a Transaction
-- =====================================================

DELIMITER //

CREATE PROCEDURE UpdateSalary
(
    IN emp_id INT,
    IN new_salary DECIMAL(10,2)
)
BEGIN

    START TRANSACTION;

    UPDATE employees
    SET salary = new_salary
    WHERE employee_id = emp_id;

    COMMIT;

END //

DELIMITER ;



-- =====================================================
-- Challenge Solution 4
-- Employee Count by Department
-- =====================================================

DELIMITER //

CREATE PROCEDURE CountEmployeesByDepartment
(
    IN dept_id INT
)
BEGIN

    SELECT COUNT(*) AS total_employees
    FROM employees
    WHERE department_id = dept_id;

END //

DELIMITER ;



-- =====================================================
-- Challenge Solution 5
-- Employees Hired After a Date
-- =====================================================

DELIMITER //

CREATE PROCEDURE EmployeesHiredAfter
(
    IN hire_date_input DATE
)
BEGIN

    SELECT
        employee_id,
        first_name,
        hire_date
    FROM employees
    WHERE hire_date > hire_date_input;

END //

DELIMITER ;