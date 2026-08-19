-- =============================================
-- FILE: 02_start_transaction.sql
-- =============================================

-- START TRANSACTION begins a new transaction.

START TRANSACTION;

UPDATE employees
SET salary = salary + 1000
WHERE employee_id = 1;

-- The change is part of the transaction.
-- It can still be committed or rolled back.

ROLLBACK;