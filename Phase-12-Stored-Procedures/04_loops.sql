/*
=========================================================
SQL STORED PROCEDURES
LOOPS
=========================================================

Description:
Loops allow a block of SQL statements to execute
repeatedly until a specified condition is met.

MySQL supports:

• WHILE
• REPEAT
• LOOP

Loop control statements:

• LEAVE
• ITERATE
*/


/*
=========================================================
Example 1
WHILE Loop
=========================================================

Print numbers from 1 to 5.
*/

DELIMITER //

CREATE PROCEDURE PrintNumbers()
BEGIN

    DECLARE counter INT DEFAULT 1;

    WHILE counter <= 5 DO

        SELECT counter AS number;

        SET counter = counter + 1;

    END WHILE;

END //

DELIMITER ;



CALL PrintNumbers();



/*
=========================================================
Example 2
REPEAT Loop
=========================================================

Print numbers from 1 to 5.
*/

DELIMITER //

CREATE PROCEDURE RepeatNumbers()
BEGIN

    DECLARE counter INT DEFAULT 1;

    REPEAT

        SELECT counter AS number;

        SET counter = counter + 1;

    UNTIL counter > 5

    END REPEAT;

END //

DELIMITER ;



CALL RepeatNumbers();



/*
=========================================================
Example 3
LOOP Statement
=========================================================

Print numbers from 1 to 5.
*/

DELIMITER //

CREATE PROCEDURE LoopNumbers()
BEGIN

    DECLARE counter INT DEFAULT 1;

    number_loop: LOOP

        SELECT counter AS number;

        SET counter = counter + 1;

        IF counter > 5 THEN
            LEAVE number_loop;
        END IF;

    END LOOP number_loop;

END //

DELIMITER ;



CALL LoopNumbers();



/*
=========================================================
Example 4
LEAVE Statement
=========================================================

Exit the loop when the value reaches 3.
*/

DELIMITER //

CREATE PROCEDURE LeaveExample()
BEGIN

    DECLARE counter INT DEFAULT 1;

    leave_loop: LOOP

        IF counter = 3 THEN
            LEAVE leave_loop;
        END IF;

        SELECT counter AS number;

        SET counter = counter + 1;

    END LOOP leave_loop;

END //

DELIMITER ;



CALL LeaveExample();



/*
=========================================================
Example 5
ITERATE Statement
=========================================================

Skip number 3.
*/

DELIMITER //

CREATE PROCEDURE IterateExample()
BEGIN

    DECLARE counter INT DEFAULT 0;

    iterate_loop: LOOP

        SET counter = counter + 1;

        IF counter = 3 THEN
            ITERATE iterate_loop;
        END IF;

        SELECT counter AS number;

        IF counter >= 5 THEN
            LEAVE iterate_loop;
        END IF;

    END LOOP iterate_loop;

END //

DELIMITER ;



CALL IterateExample();



/*
=========================================================
WHILE vs REPEAT vs LOOP
=========================================================

WHILE

✔ Condition checked before execution.


REPEAT

✔ Condition checked after execution.

✔ Executes at least once.


LOOP

✔ Infinite loop unless LEAVE is used.
*/



/*
=========================================================
Real-World Uses
=========================================================

✔ Process multiple records

✔ Generate reports

✔ Perform calculations

✔ Batch data processing

✔ Data migration

✔ Data validation
*/



/*
=========================================================
Best Practices
=========================================================

✔ Always define an exit condition.

✔ Avoid infinite loops.

✔ Keep loop logic simple.

✔ Use LEAVE when appropriate.

✔ Test loops with different values.
*/



/*
=========================================================
Summary
=========================================================

WHILE
------
Repeats while a condition is TRUE.

REPEAT
-------
Repeats until a condition becomes TRUE.

LOOP
----
General-purpose loop that requires LEAVE
to exit.

LEAVE
-----
Exits a loop.

ITERATE
-------
Skips the current iteration and continues
with the next iteration.
*/