-- ===========================================
-- SELF JOIN
-- ===========================================

-- Employees and their managers
SELECT e.first_name AS employee,
       m.first_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

-- Employees in the same department
SELECT e1.first_name AS employee_1,
       e2.first_name AS employee_2,
       e1.department_id
FROM employees e1
INNER JOIN employees e2
ON e1.department_id = e2.department_id
AND e1.employee_id <> e2.employee_id;