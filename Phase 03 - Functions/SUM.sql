-- ===========================================
-- SUM() Function
-- ===========================================

-- Total sales
SELECT SUM(total_amount)
FROM orders;

-- Total Electronics price
SELECT SUM(price)
FROM products
WHERE category = 'Electronics';

-- Total Stationery price
SELECT SUM(price)
FROM products
WHERE category = 'Stationery';

-- Sum of orders greater than 5000
SELECT SUM(total_amount)
FROM orders
WHERE total_amount > 5000;