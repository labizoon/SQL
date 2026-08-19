-- =============================================
-- PHASE 14: TRANSACTIONS
-- FILE: 07_transaction_with_update.sql
-- =============================================

-- UPDATE operations can be performed inside
-- a transaction.

-- Example 1: Update one employee

START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 1;

-- Check the change before committing
SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1;

COMMIT;


-- =============================================
-- Example 2: UPDATE with ROLLBACK
-- =============================================

START TRANSACTION;

UPDATE employees
SET salary = salary + 10000
WHERE employee_id = 2;

-- Cancel the salary increase
ROLLBACK;


-- Verify that the change was cancelled
SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 2;