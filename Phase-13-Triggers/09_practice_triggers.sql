-- ============================================================
-- PHASE 13 - TRIGGERS
-- File: 09_practice_triggers.sql
-- Database: sample_db
-- Topic: Trigger Practice
-- ============================================================

USE sample_db;


-- ============================================================
-- PRACTICE 1 - INSERT TRIGGER
-- ============================================================
-- Create a trigger that automatically creates a record
-- in an audit table whenever a new customer is inserted.
--
-- Tables:
-- customers
-- customer_audit
--
-- Hint:
-- Use AFTER INSERT
-- Use NEW.customer_id
-- Use NEW.first_name
-- Use NEW.last_name
-- ============================================================


-- YOUR CODE HERE



-- ============================================================
-- PRACTICE 2 - UPDATE TRIGGER
-- ============================================================
-- Create a trigger that records the old and new salary
-- whenever an employee's salary is changed.
--
-- Tables:
-- employees
-- employee_salary_history
--
-- Hint:
-- Use AFTER UPDATE
-- Use OLD.salary
-- Use NEW.salary
-- ============================================================


-- YOUR CODE HERE



-- ============================================================
-- PRACTICE 3 - DELETE TRIGGER
-- ============================================================
-- Create a trigger that stores deleted customer information
-- in a customer_archive table.
--
-- Hint:
-- Use AFTER DELETE
-- Use OLD.customer_id
-- Use OLD.first_name
-- Use OLD.last_name
-- ============================================================


-- YOUR CODE HERE



-- ============================================================
-- PRACTICE 4 - VALIDATION TRIGGER
-- ============================================================
-- Create a trigger that prevents an employee from having
-- a negative salary.
--
-- Hint:
-- Use BEFORE INSERT
-- Use NEW.salary
-- Use SIGNAL SQLSTATE '45000'
-- ============================================================


-- YOUR CODE HERE



-- ============================================================
-- PRACTICE 5 - STOCK TRIGGER
-- ============================================================
-- Create a trigger that decreases product stock when
-- a new order_item is inserted.
--
-- Hint:
-- UPDATE products
-- SET stock_quantity = stock_quantity - NEW.quantity
-- WHERE product_id = NEW.product_id;
-- ============================================================


-- YOUR CODE HERE



-- ============================================================
-- PRACTICE 6 - OLD AND NEW
-- ============================================================
-- Create an UPDATE trigger that records:
--
-- product_id
-- old product name
-- new product name
-- old price
-- new price
--
-- Hint:
-- OLD = previous value
-- NEW = new value
-- ============================================================


-- YOUR CODE HERE



-- ============================================================
-- PRACTICE 7 - AUDIT TRIGGER
-- ============================================================
-- Create an audit trigger that records whenever an employee's
-- department changes.
--
-- Store:
-- employee_id
-- old department_id
-- new department_id
-- changed_at
--
-- Hint:
-- Use AFTER UPDATE.
-- ============================================================


-- YOUR CODE HERE



-- ============================================================
-- PRACTICE 8 - DELETE VALIDATION
-- ============================================================
-- Think about this:
--
-- Should a product that exists in an order be deleted?
--
-- Try creating a trigger that prevents deletion of a product
-- if it exists in order_items.
--
-- Hint:
-- Use BEFORE DELETE.
-- You may need SELECT ... INTO.
-- ============================================================


-- YOUR CODE HERE