/*
=========================================================
SQL STORED PROCEDURES
PROCEDURE PARAMETERS
=========================================================

Description:
Parameters allow values to be passed into and out
of a stored procedure.

MySQL supports three parameter types:

• IN     - Input parameter
• OUT    - Output parameter
• INOUT  - Input and Output parameter

Syntax:

CREATE PROCEDURE procedure_name
(
    IN parameter_name data_type,
    OUT parameter_name data_type,
    INOUT parameter_name data_type
)
BEGIN

    SQL Statements;

END;
*/


/*
=========================================================
Example 1
IN Parameter
=========================================================

Returns employees from a specific department.
*/

DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment
(
    IN dept_id INT
)
BEGIN

    SELECT
        employee_id,
        first_name,
        last_name,
        department_id
    FROM employees
    WHERE department_id = dept_id;

END //

DELIMITER ;



/*
Execute Procedure
*/

CALL GetEmployeesByDepartment(2);



/*
=========================================================
Example 2
IN Parameter
=========================================================

Returns employees earning more than a given salary.
*/

DELIMITER //

CREATE PROCEDURE GetEmployeesBySalary
(
    IN min_salary DECIMAL(10,2)
)
BEGIN

    SELECT
        employee_id,
        first_name,
        salary
    FROM employees
    WHERE salary >= min_salary;

END //

DELIMITER ;



CALL GetEmployeesBySalary(60000);



/*
=========================================================
Example 3
OUT Parameter
=========================================================

Returns the total number of employees.
*/

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



CALL GetEmployeeCount(@total);

SELECT @total AS total_employees;



/*
=========================================================
Example 4
OUT Parameter
=========================================================

Returns the average salary.
*/

DELIMITER //

CREATE PROCEDURE GetAverageSalary
(
    OUT avg_salary DECIMAL(10,2)
)
BEGIN

    SELECT AVG(salary)
    INTO avg_salary
    FROM employees;

END //

DELIMITER ;



CALL GetAverageSalary(@average_salary);

SELECT @average_salary AS average_salary;



/*
=========================================================
Example 5
INOUT Parameter
=========================================================

Adds a bonus amount to an existing salary value.
*/

DELIMITER //

CREATE PROCEDURE AddBonus
(
    INOUT employee_salary DECIMAL(10,2)
)
BEGIN

    SET employee_salary = employee_salary + 5000;

END //

DELIMITER ;



SET @salary = 60000;

CALL AddBonus(@salary);

SELECT @salary AS updated_salary;



/*
=========================================================
IN vs OUT vs INOUT
=========================================================

IN

✔ Receives values

✔ Used as input

✔ Most commonly used


OUT

✔ Returns values

✔ Cannot receive input values

✔ Used for calculated results


INOUT

✔ Receives values

✔ Returns updated values

✔ Can modify existing values
*/



/*
=========================================================
Real-World Examples
=========================================================

IN

✔ Search employees by department

✔ Search products by category

✔ Search orders by customer


OUT

✔ Total employees

✔ Average salary

✔ Total sales


INOUT

✔ Increase salary

✔ Apply discounts

✔ Update account balance
*/



/*
=========================================================
Best Practices
=========================================================

✔ Use IN for search criteria.

✔ Use OUT for returning calculated values.

✔ Use INOUT only when both input and output
are required.

✔ Use meaningful parameter names.

✔ Keep procedures simple and reusable.
*/



/*
=========================================================
Summary
=========================================================

IN
---
Input only

OUT
----
Output only

INOUT
------
Input and Output
*/