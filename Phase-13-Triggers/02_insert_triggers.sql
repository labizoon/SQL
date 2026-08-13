-- ============================================================
-- PHASE 13 - TRIGGERS
-- File: 02_insert_triggers.sql
-- Database: sample_db
-- Topic: AFTER INSERT Trigger
-- ============================================================


USE sample_db;


-- ============================================================
-- 1. CREATE ORDER LOG TABLE
-- ============================================================
-- This table stores a record whenever a new order is created.
-- ============================================================

CREATE TABLE IF NOT EXISTS order_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    action VARCHAR(50) NOT NULL,
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ============================================================
-- 2. REMOVE EXISTING TRIGGER
-- ============================================================
-- This allows the file to be safely re-run while learning.
-- ============================================================

DROP TRIGGER IF EXISTS after_order_insert;


-- ============================================================
-- 3. CREATE AFTER INSERT TRIGGER
-- ============================================================
-- Whenever a new order is inserted into the orders table,
-- a record is automatically inserted into order_logs.
-- ============================================================

DELIMITER //

CREATE TRIGGER after_order_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN

    INSERT INTO order_logs
        (order_id, action)
    VALUES
        (NEW.order_id, 'Order Created');

END //

DELIMITER ;


-- ============================================================
-- 4. TEST THE TRIGGER
-- ============================================================

INSERT INTO orders
    (customer_id, employee_id, order_date, total_amount, status)
VALUES
    (1, 1, CURDATE(), 0, 'Pending');


-- ============================================================
-- 5. CHECK THE TRIGGER RESULT
-- ============================================================

SELECT *
FROM order_logs;