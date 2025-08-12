-- Create the orders table (if it doesn't exist)
/*CREATE TABLE IF NOT EXISTS online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

-- Sample data insertion (optional - for testing if you don't have data)
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2023-01-15', 100.50, 101),
(2, '2023-01-20', 150.75, 102),
(3, '2023-02-05', 200.00, 103),
(4, '2023-02-10', 175.25, 101),
(5, '2023-03-12', 300.50, 104),
(6, '2023-03-18', 250.75, 102),
(7, '2023-04-22', 180.00, 103),
(8, '2023-05-30', 220.50, 101),
(9, '2023-06-11', 190.25, 104),
(10, '2023-07-09', 210.00, 102),
(11, '2023-08-17', 230.75, 103),
(12, '2023-09-25', 240.50, 101),
(13, '2023-10-03', 260.25, 104),
(14, '2023-11-19', 280.00, 102),
(15, '2023-12-24', 300.75, 103);

-- Monthly Sales Trend Analysis (Main Query)
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    ROUND(SUM(amount), 2) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume,
    ROUND(SUM(amount) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM 
    online_sales
WHERE
    order_date >= '2023-01-01' AND order_date < '2024-01-01'
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY 
    year ASC,
    month ASC;*/-- Monthly Sales Trend Analysis with all requested features
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
WHERE
    -- f. Limit results for specific time periods (Q1 2023 in this example)
    order_date >= '2023-01-01' AND order_date <= '2023-03-31'
    -- You could also use: order_date BETWEEN '2023-01-01' AND '2023-03-31'
GROUP BY 
    -- b. GROUP BY year/month
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY 
    -- e. Use ORDER BY for sorting (chronological by default)
    year ASC,
    month ASC;