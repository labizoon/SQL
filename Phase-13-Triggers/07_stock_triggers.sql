-- ============================================================
-- PHASE 13 - TRIGGERS
-- File: 07_stock_triggers.sql
-- Database: sample_db
-- Topic: Stock Triggers
-- ============================================================

USE sample_db;


-- ============================================================
-- 1. REMOVE EXISTING TRIGGER
-- ============================================================

DROP TRIGGER IF EXISTS after_order_item_insert_stock;


-- ============================================================
-- 2. CREATE STOCK UPDATE TRIGGER
-- ============================================================
-- When a product is added to an order, the ordered quantity
-- is automatically deducted from the product stock.
-- ============================================================

DELIMITER //

CREATE TRIGGER after_order_item_insert_stock
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN

    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;

END //

DELIMITER ;


-- ============================================================
-- 3. CHECK PRODUCT STOCK BEFORE TESTING
-- ============================================================

SELECT
    product_id,
    product_name,
    stock_quantity
FROM products
WHERE product_id = 1;


-- ============================================================
-- 4. CHECK ORDER BEFORE TESTING
-- ============================================================

SELECT *
FROM orders
LIMIT 5;


-- ============================================================
-- 5. TEST THE TRIGGER
-- ============================================================
-- Add a product to an order.
-- Change the IDs if necessary.

INSERT INTO order_items
    (order_id, product_id, quantity, unit_price, subtotal)
VALUES
    (1, 1, 2, 1000, 2000);


-- ============================================================
-- 6. CHECK THE UPDATED STOCK
-- ============================================================

SELECT
    product_id,
    product_name,
    stock_quantity
FROM products
WHERE product_id = 1;