-- =============================================
-- PHASE 14: TRANSACTIONS
-- FILE: 09_multiple_operations.sql
-- =============================================

-- A transaction can contain multiple
-- SQL operations.

-- =============================================
-- Example 1: Multiple operations + COMMIT
-- =============================================

START TRANSACTION;

-- Operation 1: Insert a new employee
INSERT INTO employees
(first_name, last_name, email, salary)
VALUES
('Transaction', 'Test', 'transaction.test@example.com', 60000);

-- Operation 2: Update an existing employee
UPDATE employees
SET salary = salary + 1000
WHERE employee_id = 1;

-- Check the changes
SELECT *
FROM employees
WHERE email = 'transaction.test@example.com';

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1;

-- Save all changes
COMMIT;


-- =============================================
-- Example 2: Multiple operations + ROLLBACK
-- =============================================

START TRANSACTION;

-- Operation 1
UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 2;

-- Operation 2
UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 3;

-- Cancel all changes made in this transaction
ROLLBACK;

-- Verify that the changes were cancelled
SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id IN (2, 3);