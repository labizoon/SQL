-- =============================================
-- FILE: 03_commit.sql
-- =============================================

-- COMMIT permanently saves the changes
-- made during the transaction.

START TRANSACTION;

UPDATE employees
SET salary = salary + 2000
WHERE employee_id = 1;

COMMIT;

-- The salary increase has been saved.