-- ============================================================
-- PHASE 13 - TRIGGERS
-- File: 06_validation_triggers.sql
-- Database: sample_db
-- Topic: Validation Triggers
-- ============================================================

USE sample_db;


-- ============================================================
-- 1. REMOVE EXISTING TRIGGERS
-- ============================================================

DROP TRIGGER IF EXISTS before_product_insert_validation;
DROP TRIGGER IF EXISTS before_product_update_validation;


-- ============================================================
-- 2. BEFORE INSERT VALIDATION TRIGGER
-- ============================================================
-- Prevents a product from being inserted with:
--   - Negative price
--   - Negative stock quantity
-- ============================================================

DELIMITER //

CREATE TRIGGER before_product_insert_validation
BEFORE INSERT ON products
FOR EACH ROW
BEGIN

    IF NEW.price < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product price cannot be negative';
    END IF;

    IF NEW.stock_quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock quantity cannot be negative';
    END IF;

END //

DELIMITER ;


-- ============================================================
-- 3. BEFORE UPDATE VALIDATION TRIGGER
-- ============================================================
-- Prevents an existing product from being updated with:
--   - Negative price
--   - Negative stock quantity
-- ============================================================

DELIMITER //

CREATE TRIGGER before_product_update_validation
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN

    IF NEW.price < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product price cannot be negative';
    END IF;

    IF NEW.stock_quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock quantity cannot be negative';
    END IF;

END //

DELIMITER ;


-- ============================================================
-- 4. TEST INSERT VALIDATION
-- ============================================================
-- This should produce an error because the price is negative.

INSERT INTO products
    (product_name, category_id, price, stock_quantity)
VALUES
    ('Invalid Product', 1, -500, 10);


-- ============================================================
-- 5. TEST UPDATE VALIDATION
-- ============================================================
-- This should also produce an error.

UPDATE products
SET price = -100
WHERE product_id = 1;