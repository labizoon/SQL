-- =============================================
-- FILE: 06_transaction_with_insert.sql
-- =============================================

-- INSERT can be used inside a transaction.

START TRANSACTION;

INSERT INTO employees
(first_name, last_name, email, salary)
VALUES
('Test', 'Employee', 'test.employee@example.com', 50000);

-- Check the inserted record.
SELECT *
FROM employees
WHERE email = 'test.employee@example.com';

-- Save the INSERT permanently.
COMMIT;