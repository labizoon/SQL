-- =============================================
-- PHASE 14: TRANSACTIONS
-- FILE: 10_transaction_practice.sql
-- =============================================

-- Practice exercises for SQL transactions.


-- =============================================
-- Practice 1: INSERT + ROLLBACK
-- =============================================

START TRANSACTION;

INSERT INTO employees
(first_name, last_name, email, salary)
VALUES
('Practice', 'Employee', 'practice01@example.com', 55000);

SELECT *
FROM employees
WHERE email = 'practice01@example.com';

ROLLBACK;

SELECT *
FROM employees
WHERE email = 'practice01@example.com';


-- =============================================
-- Practice 2: UPDATE + ROLLBACK
-- =============================================

START TRANSACTION;

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 1;

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1;

ROLLBACK;

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1;


-- =============================================
-- Practice 3: UPDATE + COMMIT
-- =============================================

START TRANSACTION;

UPDATE employees
SET salary = salary + 2000
WHERE employee_id = 1;

COMMIT;


-- =============================================
-- Practice 4: SAVEPOINT
-- =============================================

START TRANSACTION;

UPDATE employees
SET salary = salary + 1000
WHERE employee_id = 1;

SAVEPOINT first_change;

UPDATE employees
SET salary = salary + 2000
WHERE employee_id = 2;

ROLLBACK TO SAVEPOINT first_change;

COMMIT;