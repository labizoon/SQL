-- ============================================================
-- PHASE 13 - TRIGGERS
-- File: 08_audit_triggers.sql
-- Database: sample_db
-- Topic: Audit Triggers
-- ============================================================

USE sample_db;


-- ============================================================
-- 1. CREATE PRODUCT AUDIT TABLE
-- ============================================================

CREATE TABLE IF NOT EXISTS product_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(100),
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    action_type VARCHAR(50),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ============================================================
-- 2. REMOVE EXISTING TRIGGER
-- ============================================================

DROP TRIGGER IF EXISTS after_product_update_audit;


-- ============================================================
-- 3. CREATE AUDIT TRIGGER
-- ============================================================
-- Records product price changes automatically.
-- ============================================================

DELIMITER //

CREATE TRIGGER after_product_update_audit
AFTER UPDATE ON products
FOR EACH ROW
BEGIN

    IF OLD.price <> NEW.price THEN

        INSERT INTO product_audit
            (
                product_id,
                product_name,
                old_price,
                new_price,
                action_type
            )
        VALUES
            (
                NEW.product_id,
                NEW.product_name,
                OLD.price,
                NEW.price,
                'PRICE UPDATED'
            );

    END IF;

END //

DELIMITER ;


-- ============================================================
-- 4. CHECK PRODUCT BEFORE UPDATE
-- ============================================================

SELECT
    product_id,
    product_name,
    price
FROM products
WHERE product_id = 1;


-- ============================================================
-- 5. TEST THE AUDIT TRIGGER
-- ============================================================

UPDATE products
SET price = price + 500
WHERE product_id = 1;


-- ============================================================
-- 6. CHECK AUDIT RECORD
-- ============================================================

SELECT *
FROM product_audit
ORDER BY audit_id DESC;