-- ============================================================
-- PHASE 13 - TRIGGERS
-- File: 05_old_and_new.sql
-- Database: sample_db
-- Topic: OLD and NEW
-- ============================================================

USE sample_db;


-- ============================================================
-- 1. CREATE PRODUCT CHANGE HISTORY TABLE
-- ============================================================

CREATE TABLE IF NOT EXISTS product_change_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    old_product_name VARCHAR(100),
    new_product_name VARCHAR(100),
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ============================================================
-- 2. REMOVE EXISTING TRIGGER
-- ============================================================

DROP TRIGGER IF EXISTS after_product_update;


-- ============================================================
-- 3. CREATE UPDATE TRIGGER
-- ============================================================

DELIMITER //

CREATE TRIGGER after_product_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN

    INSERT INTO product_change_history
        (
            product_id,
            old_product_name,
            new_product_name,
            old_price,
            new_price
        )
    VALUES
        (
            OLD.product_id,
            OLD.product_name,
            NEW.product_name,
            OLD.price,
            NEW.price
        );

END //

DELIMITER ;


-- ============================================================
-- 4. CHECK PRODUCT BEFORE UPDATE
-- ============================================================

SELECT *
FROM products
WHERE product_id = 1;


-- ============================================================
-- 5. TEST THE TRIGGER
-- ============================================================

UPDATE products
SET
    product_name = 'Updated Product',
    price = price + 500
WHERE product_id = 1;


-- ============================================================
-- 6. CHECK THE HISTORY
-- ============================================================

SELECT *
FROM product_change_history;