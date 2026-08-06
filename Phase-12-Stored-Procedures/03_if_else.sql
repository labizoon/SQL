/*
=========================================================
SQL STORED PROCEDURES
IF, ELSEIF, ELSE
=========================================================

Description:
Conditional statements allow a stored procedure
to execute different SQL statements based on
specified conditions.

MySQL supports:

• IF
• ELSEIF
• ELSE

Syntax:

IF condition THEN

    SQL Statements;

ELSEIF condition THEN

    SQL Statements;

ELSE

    SQL Statements;

END IF;
*/


/*
=========================================================
Example 1
Check Employee Salary
=========================================================
*/

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



CALL CheckSalary(90000);
CALL CheckSalary(65000);
CALL CheckSalary(35000);



/*
=========================================================
Example 2
Check Employee Status
=========================================================
*/

DELIMITER //

CREATE PROCEDURE CheckEmployeeStatus
(
    IN employee_status VARCHAR(20)
)
BEGIN

    IF employee_status = 'Active' THEN

        SELECT 'Employee is Active' AS message;

    ELSEIF employee_status = 'On Leave' THEN

        SELECT 'Employee is Currently on Leave' AS message;

    ELSE

        SELECT 'Employee is Inactive' AS message;

    END IF;

END //

DELIMITER ;



CALL CheckEmployeeStatus('Active');
CALL CheckEmployeeStatus('On Leave');
CALL CheckEmployeeStatus('Inactive');



/*
=========================================================
Example 3
Check Department
=========================================================
*/

DELIMITER //

CREATE PROCEDURE DepartmentMessage
(
    IN dept_id INT
)
BEGIN

    IF dept_id = 1 THEN

        SELECT 'Human Resources' AS department;

    ELSEIF dept_id = 2 THEN

        SELECT 'Finance' AS department;

    ELSEIF dept_id = 3 THEN

        SELECT 'IT Department' AS department;

    ELSE

        SELECT 'Unknown Department' AS department;

    END IF;

END //

DELIMITER ;



CALL DepartmentMessage(1);
CALL DepartmentMessage(2);
CALL DepartmentMessage(5);



/*
=========================================================
Example 4
Check Employee Bonus Eligibility
=========================================================
*/

DELIMITER //

CREATE PROCEDURE BonusEligibility
(
    IN salary DECIMAL(10,2)
)
BEGIN

    IF salary >= 70000 THEN

        SELECT 'Eligible for Bonus' AS result;

    ELSE

        SELECT 'Not Eligible for Bonus' AS result;

    END IF;

END //

DELIMITER ;



CALL BonusEligibility(85000);
CALL BonusEligibility(45000);



/*
=========================================================
Nested IF Example
=========================================================
*/

DELIMITER //

CREATE PROCEDURE SalaryReview
(
    IN salary DECIMAL(10,2),
    IN experience_years INT
)
BEGIN

    IF salary >= 70000 THEN

        IF experience_years >= 5 THEN

            SELECT 'Eligible for Promotion' AS result;

        ELSE

            SELECT 'Eligible for Salary Review' AS result;

        END IF;

    ELSE

        SELECT 'Performance Review Required' AS result;

    END IF;

END //

DELIMITER ;



CALL SalaryReview(80000, 6);
CALL SalaryReview(80000, 2);
CALL SalaryReview(45000, 4);



/*
=========================================================
Real-World Uses
=========================================================

✔ Salary Classification

✔ Employee Eligibility

✔ Discount Calculation

✔ Tax Calculation

✔ Leave Approval

✔ Order Status

✔ Student Grades
*/



/*
=========================================================
Best Practices
=========================================================

✔ Keep conditions simple.

✔ Avoid deeply nested IF statements.

✔ Use meaningful variable names.

✔ Test all possible conditions.

✔ Comment complex logic.
*/



/*
=========================================================
Summary
=========================================================

IF

ELSEIF

ELSE

END IF;

These statements allow procedures to make
decisions based on different conditions.
*/