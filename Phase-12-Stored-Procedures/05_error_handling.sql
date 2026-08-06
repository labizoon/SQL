/*
=========================================================
SQL STORED PROCEDURES
ERROR HANDLING
=========================================================

Description:
Error handling allows a stored procedure to
respond gracefully when an error occurs instead
of terminating unexpectedly.

MySQL uses DECLARE ... HANDLER to handle errors.

Common handler types:

• CONTINUE HANDLER
• EXIT HANDLER

Common conditions:

• SQLEXCEPTION
• SQLWARNING
• NOT FOUND
*/


/*
=========================================================
Example 1
EXIT HANDLER
=========================================================

Stops the procedure if any SQL error occurs.
*/

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



CALL ExitHandlerExample();



/*
=========================================================
Example 2
CONTINUE HANDLER
=========================================================

Continues execution after handling a warning.
*/

DELIMITER //

CREATE PROCEDURE ContinueHandlerExample()
BEGIN

    DECLARE CONTINUE HANDLER FOR SQLWARNING
    BEGIN
        SELECT 'A SQL warning occurred.' AS message;
    END;

    SELECT 'Procedure executed successfully.' AS status;

END //

DELIMITER ;



CALL ContinueHandlerExample();



/*
=========================================================
Example 3
NOT FOUND Handler
=========================================================

Handles situations where no row is found.
*/

DELIMITER //

CREATE PROCEDURE EmployeeLookup
(
    IN emp_id INT
)
BEGIN

    DECLARE employee_name VARCHAR(100);

    DECLARE CONTINUE HANDLER FOR NOT FOUND
    BEGIN
        SELECT 'Employee not found.' AS message;
    END;

    SELECT first_name
    INTO employee_name
    FROM employees
    WHERE employee_id = emp_id;

    SELECT employee_name AS employee;

END //

DELIMITER ;



CALL EmployeeLookup(1);
CALL EmployeeLookup(999);



/*
=========================================================
Example 4
Custom Validation
=========================================================

Validate salary before processing.
*/

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



CALL ValidateSalary(50000);

/* This call generates an error */
CALL ValidateSalary(-1000);



/*
=========================================================
Example 5
Transaction Rollback on Error
=========================================================

Rollback changes if an SQL exception occurs.
*/

DELIMITER //

CREATE PROCEDURE UpdateEmployeeSalary()
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Transaction rolled back.' AS message;
    END;

    START TRANSACTION;

    UPDATE employees
    SET salary = salary + 1000
    WHERE employee_id = 1;

    COMMIT;

    SELECT 'Transaction completed successfully.' AS message;

END //

DELIMITER ;



CALL UpdateEmployeeSalary();



/*
=========================================================
Common Error Conditions
=========================================================

SQLEXCEPTION
------------
Handles SQL errors.

SQLWARNING
----------
Handles SQL warnings.

NOT FOUND
---------
Handles missing rows returned by queries.
*/



/*
=========================================================
Best Practices
=========================================================

✔ Handle expected errors.

✔ Use transactions for critical updates.

✔ Roll back changes on failure.

✔ Display meaningful error messages.

✔ Validate input before processing.

✔ Test procedures with invalid input.
*/



/*
=========================================================
Summary
=========================================================

EXIT HANDLER
------------
Stops execution after handling the error.

CONTINUE HANDLER
----------------
Handles the error and continues execution.

SIGNAL
------
Raises a custom error.

ROLLBACK
--------
Undoes changes if an error occurs.
*/