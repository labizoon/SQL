-- =============================================
-- FILE: 05_savepoint.sql
-- =============================================

-- SAVEPOINT creates a checkpoint
-- inside a transaction.

START TRANSACTION;

UPDATE employees
SET salary = salary + 1000
WHERE employee_id = 1;

SAVEPOINT salary_update;

UPDATE employees
SET salary = salary + 2000
WHERE employee_id = 2;

-- Undo only the changes made after the savepoint.
ROLLBACK TO SAVEPOINT salary_update;

-- Employee 1's change remains.
-- Employee 2's change is undone.

COMMIT;