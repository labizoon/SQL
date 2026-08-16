# Phase 13 - Triggers

This phase covers **SQL Triggers** from basic to advanced concepts using a sample retail database named `sample_db`.

## What is a Trigger?

A trigger is a database object that automatically executes when a specific event occurs on a table.

Common trigger events are:

- INSERT
- UPDATE
- DELETE

Triggers are useful for:

- Data validation
- Automatic updates
- Maintaining audit history
- Tracking changes
- Managing stock
- Enforcing business rules

---

## Database Used

**Database:** `sample_db`

The sample database contains retail-related tables such as:

- customers
- employees
- departments
- products
- orders
- order_items

---

## Folder Structure

```text
Phase 13-Triggers/
│
├── 01_basic_triggers.sql
├── 02_insert_triggers.sql
├── 03_update_triggers.sql
├── 04_delete_triggers.sql
├── 05_old_and_new.sql
├── 06_validation_triggers.sql
├── 07_stock_triggers.sql
├── 08_audit_triggers.sql
└── 09_practice_triggers.sql