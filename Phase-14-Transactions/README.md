# Phase 14 - Transactions

This phase covers SQL **Transactions** from basic to intermediate level using MySQL.

## What is a Transaction?

A transaction is a group of SQL operations treated as a single unit of work.

A transaction allows us to either:

* Save all changes using `COMMIT`
* Undo changes using `ROLLBACK`

## Transaction Flow

```text
START TRANSACTION
        |
        v
   SQL Operations
        |
   +----+----+
   |         |
   v         v
 COMMIT   ROLLBACK
   |         |
   v         v
 Save      Undo
```

## Topics Covered

### 1. Transaction Basics

Understanding what transactions are and why they are useful.

### 2. START TRANSACTION

Starts a new transaction.

```sql
START TRANSACTION;
```

### 3. COMMIT

Permanently saves changes made during the transaction.

```sql
COMMIT;
```

### 4. ROLLBACK

Cancels changes made during the current transaction.

```sql
ROLLBACK;
```

### 5. SAVEPOINT

Creates a checkpoint inside a transaction.

```sql
SAVEPOINT savepoint_name;
```

Changes after a savepoint can be undone using:

```sql
ROLLBACK TO SAVEPOINT savepoint_name;
```

### 6. Transactions with INSERT

Using transactions to control `INSERT` operations.

### 7. Transactions with UPDATE

Using transactions to control `UPDATE` operations.

### 8. Transactions with DELETE

Using transactions to control `DELETE` operations.

### 9. Multiple Operations

Performing multiple SQL operations inside a single transaction.

### 10. Transaction Practice

Practical exercises using `INSERT`, `UPDATE`, `DELETE`, `COMMIT`, `ROLLBACK`, and `SAVEPOINT`.

## Files

```text
Phase-14-Transactions/
│
├── 01_transaction_basics.sql
├── 02_start_transaction.sql
├── 03_commit.sql
├── 04_rollback.sql
├── 05_savepoint.sql
├── 06_transaction_with_insert.sql
├── 07_transaction_with_update.sql
├── 08_transaction_with_delete.sql
├── 09_multiple_operations.sql
├── 10_transaction_practice.sql
└── README.md
```

## Key Commands

```sql
START TRANSACTION;

-- SQL operations

COMMIT;
```

Or:

```sql
START TRANSACTION;

-- SQL operations

ROLLBACK;
```

For partial rollback:

```sql
START TRANSACTION;

-- Operation 1

SAVEPOINT first_change;

-- Operation 2

ROLLBACK TO SAVEPOINT first_change;

COMMIT;
```

## Key Concepts

| Command                 | Purpose                          |
| ----------------------- | -------------------------------- |
| `START TRANSACTION`     | Starts a transaction             |
| `COMMIT`                | Saves all changes                |
| `ROLLBACK`              | Undoes the transaction           |
| `SAVEPOINT`             | Creates a checkpoint             |
| `ROLLBACK TO SAVEPOINT` | Undoes changes after a savepoint |

## Learning Goal

By completing this phase, I learned how to control multiple SQL operations as a single unit of work and how to save or undo changes using transactions.

## Database Used

**MySQL / MariaDB**

## Progress

* [x] Transaction Basics
* [x] START TRANSACTION
* [x] COMMIT
* [x] ROLLBACK
* [x] SAVEPOINT
* [x] Transaction with INSERT
* [x] Transaction with UPDATE
* [x] Transaction with DELETE
* [x] Multiple Operations
* [x] Transaction Practice
