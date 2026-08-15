-- ============================================================
-- PHASE 13 - TRIGGERS
-- File: 04_delete_triggers.sql
-- Database: sample_db
-- Topic: AFTER DELETE Trigger
-- ============================================================


USE sample_db;


-- ============================================================
-- 1. CREATE DELETED PRODUCTS TABLE
-- ============================================================
-- Stores information about products that have been deleted.
-- ============================================================

CREATE TABLE IF NOT EXISTS deleted_products (
    deleted_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ============================================================
-- 2. REMOVE EXISTING TRIGGER
-- ============================================================

DROP TRIGGER IF EXISTS after_product_delete;


-- ============================================================
-- 3. CREATE AFTER DELETE TRIGGER
-- ============================================================
-- Whenever a product is deleted, its information is
-- automatically stored in deleted_products.
-- ============================================================

DELIMITER //

CREATE TRIGGER after_product_delete
AFTER DELETE ON products
FOR EACH ROW
BEGIN

    INSERT INTO deleted_products
        (product_id, product_name, price)
    VALUES
        (OLD.product_id, OLD.product_name, OLD.price);

END //

DELIMITER ;


-- ============================================================
-- 4. TEST THE TRIGGER
-- ============================================================
-- First check the product you want to delete.

SELECT *
FROM products
WHERE product_id = 1;


-- Delete the product.
-- Change product_id = 1 if necessary.

DELETE FROM products
WHERE product_id = 1;


-- ============================================================
-- 5. CHECK THE TRIGGER RESULT
-- ============================================================

SELECT *
FROM deleted_products;