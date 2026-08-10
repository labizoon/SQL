USE retail_db;

-- Departments
INSERT INTO departments (department_name)
VALUES
('Sales'),
('Human Resources'),
('IT'),
('Finance');

-- Employees
INSERT INTO employees
(first_name, last_name, department_id, salary, hire_date)
VALUES
('Ali', 'Khan', 1, 80000, '2023-01-15'),
('Ahmed', 'Malik', 1, 75000, '2023-03-10'),
('Sara', 'Ahmed', 2, 70000, '2022-06-20'),
('Ayesha', 'Raza', 3, 90000, '2021-09-12'),
('Hamza', 'Shah', 4, 85000, '2022-11-05');

-- Customers
INSERT INTO customers
(first_name, last_name, email, phone)
VALUES
('Usman', 'Ali', 'usman@example.com', '03001234567'),
('Fatima', 'Khan', 'fatima@example.com', '03111234567'),
('Hassan', 'Raza', 'hassan@example.com', '03221234567'),
('Zainab', 'Ahmed', 'zainab@example.com', '03331234567'),
('Bilal', 'Shah', 'bilal@example.com', '03441234567');

-- Categories
INSERT INTO categories (category_name)
VALUES
('Electronics'),
('Clothing'),
('Home Appliances'),
('Books');

-- Products
INSERT INTO products
(product_name, category_id, price, stock_quantity)
VALUES
('Laptop', 1, 120000, 20),
('Smartphone', 1, 80000, 30),
('T-Shirt', 2, 2500, 50),
('Jeans', 2, 5000, 40),
('Microwave', 3, 25000, 15),
('SQL Book', 4, 3500, 25);

-- Orders
INSERT INTO orders
(customer_id, employee_id, order_date, total_amount, status)
VALUES
(1, 1, '2026-08-01', 120000, 'Completed'),
(2, 2, '2026-08-02', 80000, 'Completed'),
(3, 1, '2026-08-03', 7500, 'Pending'),
(4, 2, '2026-08-04', 25000, 'Completed');

-- Order Items
INSERT INTO order_items
(order_id, product_id, quantity, unit_price, subtotal)
VALUES
(1, 1, 1, 120000, 120000),
(2, 2, 1, 80000, 80000),
(3, 3, 1, 2500, 2500),
(3, 4, 1, 5000, 5000),
(4, 5, 1, 25000, 25000);