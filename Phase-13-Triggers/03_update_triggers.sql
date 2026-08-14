-- ============================================================
-- PHASE 13 - TRIGGERS
-- File: 03_update_triggers.sql
-- Database: sample_db
-- Topic: AFTER UPDATE Trigger
-- ============================================================


USE sample_db;


-- ============================================================
-- 1. CREATE PRICE HISTORY TABLE
-- ============================================================
-- Stores the old and new price whenever a product price changes.
-- ============================================================

CREATE TABLE IF NOT EXISTS product_price_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ============================================================
-- 2. REMOVE EXISTING TRIGGER
-- ============================================================

DROP TRIGGER IF EXISTS after_product_price_update;


-- ============================================================
-- 3. CREATE AFTER UPDATE TRIGGER
-- ============================================================
-- Whenever a product is updated, the trigger checks whether
-- its price changed.
-- If the price changed, the old and new prices are recorded.
-- ============================================================

DELIMITER //

CREATE TRIGGER after_product_price_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN

    IF OLD.price <> NEW.price THEN

        INSERT INTO product_price_history
            (product_id, old_price, new_price)
        VALUES
            (NEW.product_id, OLD.price, NEW.price);

    END IF;

END //

DELIMITER ;


-- ============================================================
-- 4. TEST THE TRIGGER
-- ============================================================
-- First check an existing product.

SELECT *
FROM products
LIMIT 5;


-- Update a product's price.
-- Change product_id = 1 if your database uses another ID.

UPDATE products
SET price = price + 500
WHERE product_id = 1;


-- ============================================================
-- 5. CHECK THE TRIGGER RESULT
-- ============================================================

SELECT *
FROM product_price_history;