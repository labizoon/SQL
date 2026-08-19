-- =============================================
-- PHASE 14: TRANSACTIONS
-- FILE: 08_transaction_with_delete.sql
-- =============================================

-- DELETE operations can also be used inside
-- a transaction.

-- =============================================
-- Example 1: DELETE with ROLLBACK
-- =============================================

START TRANSACTION;

DELETE FROM employees
WHERE employee_id = 5;

-- Check whether the employee was deleted
SELECT *
FROM employees
WHERE employee_id = 5;

-- Cancel the deletion
ROLLBACK;

-- Verify that the employee is back
SELECT *
FROM employees
WHERE employee_id = 5;


-- =============================================
-- Example 2: DELETE with COMMIT
-- =============================================

START TRANSACTION;

DELETE FROM employees
WHERE employee_id = 5;

-- Permanently save the deletion
COMMIT;