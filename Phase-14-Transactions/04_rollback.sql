-- =============================================
-- FILE: 04_rollback.sql
-- =============================================

-- ROLLBACK cancels changes made
-- during the current transaction.

START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 1;

ROLLBACK;

-- The salary increase is cancelled.