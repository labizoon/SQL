-- ============================================================
-- PHASE 13 - TRIGGERS
-- File: 01_basic_triggers.sql
-- Database: sample_db
-- Topic: Basic BEFORE INSERT Trigger
-- ============================================================


USE sample_db;


-- ============================================================
-- 1. BEFORE INSERT TRIGGER
-- ============================================================
-- Prevents a negative product price.
-- If the inserted price is less than 0, it is changed to 0.
-- ============================================================

DELIMITER //

CREATE TRIGGER before_product_insert
BEFORE INSERT ON products
FOR EACH ROW
BEGIN

    IF NEW.price < 0 THEN
        SET NEW.price = 0;
    END IF;

END //

DELIMITER ;


-- ============================================================
-- 2. TEST THE TRIGGER
-- ============================================================

INSERT INTO products
    (product_name, category_id, price, stock_quantity)
VALUES
    ('Gaming Mouse', 1, -500, 10);


-- ============================================================
-- 3. CHECK THE RESULT
-- ============================================================

SELECT *
FROM products
WHERE product_name = 'Gaming Mouse';