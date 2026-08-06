/*
=========================================================
SQL STORED PROCEDURES
CREATING A STORED PROCEDURE
=========================================================

Description:
A Stored Procedure is a saved collection of SQL
statements stored in the database.

Instead of writing the same SQL query repeatedly,
you can create a procedure once and execute it
whenever needed.

Benefits:

• Code Reusability
• Better Performance
• Easier Maintenance
• Improved Security

Syntax:

DELIMITER //

CREATE PROCEDURE procedure_name()
BEGIN

    SQL Statements;

END //

DELIMITER ;
*/


/*
=========================================================
Example 1
Create Your First Procedure
=========================================================
*/

DELIMITER //

CREATE PROCEDURE GetAllEmployees()
BEGIN

    SELECT *
    FROM employees;

END //

DELIMITER ;



/*
=========================================================
Execute the Procedure
=========================================================
*/

CALL GetAllEmployees();



/*
=========================================================
Example 2
Display Employee Names
=========================================================
*/

DELIMITER //

CREATE PROCEDURE GetEmployeeNames()
BEGIN

    SELECT
        employee_id,
        first_name,
        last_name
    FROM employees;

END //

DELIMITER ;



CALL GetEmployeeNames();



/*
=========================================================
Example 3
Employees with High Salary
=========================================================
*/

DELIMITER //

CREATE PROCEDURE GetHighSalaryEmployees()
BEGIN

    SELECT
        employee_id,
        first_name,
        salary
    FROM employees
    WHERE salary > 60000;

END //

DELIMITER ;



CALL GetHighSalaryEmployees();



/*
=========================================================
Example 4
Employees by Department
=========================================================
*/

DELIMITER //

CREATE PROCEDURE GetDepartmentEmployees()
BEGIN

    SELECT
        employee_id,
        first_name,
        department_id
    FROM employees
    ORDER BY department_id;

END //

DELIMITER ;



CALL GetDepartmentEmployees();



/*
=========================================================
Example 5
Department Summary
=========================================================
*/

DELIMITER //

CREATE PROCEDURE DepartmentSummary()
BEGIN

    SELECT
        department_id,
        COUNT(*) AS total_employees,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id;

END //

DELIMITER ;



CALL DepartmentSummary();



/*
=========================================================
Advantages of Stored Procedures
=========================================================

✔ Reusable SQL code

✔ Faster execution

✔ Easier maintenance

✔ Better security

✔ Reduced network traffic
*/



/*
=========================================================
Limitations
=========================================================

✖ More difficult to debug

✖ Database-specific syntax

✖ Can become complex if not organized
*/



/*
=========================================================
Best Practices
=========================================================

✔ Use meaningful procedure names.

✔ Keep procedures focused on one task.

✔ Add comments for complex logic.

✔ Test procedures before deployment.

✔ Document procedure purpose.
*/



/*
=========================================================
Summary
=========================================================

Create Procedure

CREATE PROCEDURE procedure_name()
BEGIN

    SQL Statements;

END;


Execute Procedure

CALL procedure_name();
*/