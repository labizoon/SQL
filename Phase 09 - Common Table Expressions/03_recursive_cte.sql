/*
=========================================================
SQL COMMON TABLE EXPRESSIONS (CTEs)
RECURSIVE CTE
=========================================================

Description:
A Recursive CTE is a CTE that references itself.
It is mainly used to work with hierarchical or
tree-structured data such as:

• Employee → Manager hierarchy
• Organization charts
• Category trees
• Folder structures
• Bill of Materials (BOM)

A Recursive CTE consists of two parts:

1. Anchor Member
   - The starting query.
   - Executes only once.

2. Recursive Member
   - References the CTE itself.
   - Executes repeatedly until no more rows are returned.

Syntax:

WITH RECURSIVE cte_name AS
(
    -- Anchor Member

    UNION ALL

    -- Recursive Member
)
SELECT *
FROM cte_name;

Note:
MySQL 8+, PostgreSQL and SQL Server support
recursive CTEs.
*/


-- =====================================================
-- Example 1
-- Employee-Manager Hierarchy
-- =====================================================

WITH RECURSIVE employee_hierarchy AS
(
    -- Anchor Member
    SELECT
        employee_id,
        first_name,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive Member
    SELECT
        e.employee_id,
        e.first_name,
        e.manager_id,
        eh.level + 1
    FROM employees e
    JOIN employee_hierarchy eh
        ON e.manager_id = eh.employee_id
)

SELECT *
FROM employee_hierarchy;


-- =====================================================
-- Example 2
-- Display Organization Levels
-- =====================================================

WITH RECURSIVE organization_chart AS
(
    SELECT
        employee_id,
        first_name,
        manager_id,
        1 AS hierarchy_level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.first_name,
        e.manager_id,
        oc.hierarchy_level + 1
    FROM employees e
    JOIN organization_chart oc
        ON e.manager_id = oc.employee_id
)

SELECT *
FROM organization_chart
ORDER BY hierarchy_level;


-- =====================================================
-- Example 3
-- Category Hierarchy
-- =====================================================

WITH RECURSIVE category_tree AS
(
    SELECT
        category_id,
        category_name,
        parent_category_id
    FROM categories
    WHERE parent_category_id IS NULL

    UNION ALL

    SELECT
        c.category_id,
        c.category_name,
        c.parent_category_id
    FROM categories c
    JOIN category_tree ct
        ON c.parent_category_id = ct.category_id
)

SELECT *
FROM category_tree;


-- =====================================================
-- Example 4
-- Generate Numbers 1 to 10
-- =====================================================

WITH RECURSIVE numbers AS
(
    SELECT 1 AS number

    UNION ALL

    SELECT number + 1
    FROM numbers
    WHERE number < 10
)

SELECT *
FROM numbers;


-- =====================================================
-- Example 5
-- Generate Calendar Dates
-- =====================================================

WITH RECURSIVE calendar AS
(
    SELECT DATE('2025-01-01') AS calendar_date

    UNION ALL

    SELECT calendar_date + INTERVAL 1 DAY
    FROM calendar
    WHERE calendar_date < '2025-01-10'
)

SELECT *
FROM calendar;


-- =====================================================
-- Example 6
-- Employee Reporting Chain
-- =====================================================

WITH RECURSIVE reporting_chain AS
(
    SELECT
        employee_id,
        first_name,
        manager_id,
        first_name AS reporting_path
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.first_name,
        e.manager_id,
        CONCAT(rc.reporting_path,
               ' -> ',
               e.first_name)
    FROM employees e
    JOIN reporting_chain rc
        ON e.manager_id = rc.employee_id
)

SELECT *
FROM reporting_chain;


-- =====================================================
-- Example 7
-- Total Levels in Organization
-- =====================================================

WITH RECURSIVE hierarchy AS
(
    SELECT
        employee_id,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.manager_id,
        h.level + 1
    FROM employees e
    JOIN hierarchy h
        ON e.manager_id = h.employee_id
)

SELECT
    MAX(level) AS total_levels
FROM hierarchy;