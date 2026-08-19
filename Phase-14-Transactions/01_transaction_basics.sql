-- =============================================
-- PHASE 14: TRANSACTIONS
-- FILE: 01_transaction_basics.sql
-- =============================================

-- A transaction is a group of SQL operations
-- treated as one unit of work.

-- Basic transaction flow:
-- START TRANSACTION
--      ↓
-- SQL operations
--      ↓
-- COMMIT or ROLLBACK

START TRANSACTION;

-- SQL operations go here

COMMIT;