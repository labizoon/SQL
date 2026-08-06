/*
=========================================================
SQL STORED PROCEDURES
BEST PRACTICES
=========================================================

Description:
Stored procedures improve code reusability,
performance, and security when written properly.

Following best practices helps produce
maintainable and efficient database code.
*/


/*
=========================================================
BEST PRACTICE 1
Use Meaningful Procedure Names
=========================================================
*/

-- Good

DELIMITER //

CREATE PROCEDURE GetEmployeeDetails()
BEGIN

    SELECT *
    FROM employees;

END //

DELIMITER ;



-- Avoid

/*
CREATE PROCEDURE proc1()
BEGIN
    SELECT * FROM employees;
END;
*/



/*
=========================================================
BEST PRACTICE 2
Keep Procedures Focused
=========================================================

Each procedure should perform one task only.

Good Examples:

✔ GetEmployeeDetails()

✔ UpdateEmployeeSalary()

✔ DeleteEmployee()

Avoid creating one procedure that performs
many unrelated operations.
*/



/*
=========================================================
BEST PRACTICE 3
Use Parameters Instead of Hardcoding
=========================================================
*/

DELIMITER //

CREATE PROCEDURE GetEmployeeByDepartment
(
    IN dept_id INT
)
BEGIN

    SELECT
        employee_id,
        first_name
    FROM employees
    WHERE department_id = dept_id;

END //

DELIMITER ;



CALL GetEmployeeByDepartment(2);



/*
=========================================================
BEST PRACTICE 4
Validate Input Values
=========================================================
*/

DELIMITER //

CREATE PROCEDURE ValidateAge
(
    IN employee_age INT
)
BEGIN

    IF employee_age < 18 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Age must be at least 18.';

    ELSE

        SELECT 'Valid Age' AS result;

    END IF;

END //

DELIMITER ;



/*
=========================================================
BEST PRACTICE 5
Handle Errors
=========================================================

Always use handlers when procedures perform
important operations such as updates,
deletes, or transactions.
*/



/*
=========================================================
BEST PRACTICE 6
Use Transactions
=========================================================

START TRANSACTION;

UPDATE employees
SET salary = salary + 500
WHERE employee_id = 1;

COMMIT;

If an error occurs:

ROLLBACK;
*/



/*
=========================================================
BEST PRACTICE 7
Avoid SELECT *
=========================================================
*/

-- Good

SELECT
    employee_id,
    first_name,
    salary
FROM employees;



-- Avoid

/*
SELECT *
FROM employees;
*/



/*
=========================================================
BEST PRACTICE 8
Document Procedures
=========================================================

Add comments explaining:

✔ Purpose

✔ Parameters

✔ Return values

✔ Business logic
*/



/*
=========================================================
BEST PRACTICE 9
Keep Procedures Short
=========================================================

Large procedures are harder to maintain.

Break complex logic into multiple procedures
whenever possible.
*/



/*
=========================================================
BEST PRACTICE 10
Test Thoroughly
=========================================================

Test procedures with:

✔ Valid inputs

✔ Invalid inputs

✔ Boundary values

✔ Empty tables

✔ Large datasets
*/



/*
=========================================================
COMMON MISTAKES
=========================================================

✖ Hardcoded values

✖ No error handling

✖ No transactions

✖ Deep nesting

✖ Poor naming

✖ Missing comments

✖ Returning unnecessary columns
*/



/*
=========================================================
REAL-WORLD USES
=========================================================

✔ Payroll Processing

✔ Monthly Reports

✔ Order Processing

✔ Inventory Updates

✔ Employee Management

✔ Banking Transactions

✔ Data Validation
*/



/*
=========================================================
SUMMARY
=========================================================

✔ Use meaningful names.

✔ Use parameters.

✔ Validate inputs.

✔ Handle errors.

✔ Use transactions.

✔ Keep procedures small.

✔ Avoid SELECT *.

✔ Document business logic.

✔ Test all scenarios.
*/