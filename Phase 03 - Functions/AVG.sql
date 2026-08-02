-- ===========================================
-- AVG() Function
-- ===========================================

-- Average product price
SELECT AVG(price)
FROM products;

-- Average order amount
SELECT AVG(total_amount)
FROM orders;

-- Average Electronics price
SELECT AVG(price)
FROM products
WHERE category = 'Electronics';

-- Average Stationery price
SELECT AVG(price)
FROM products
WHERE category = 'Stationery';