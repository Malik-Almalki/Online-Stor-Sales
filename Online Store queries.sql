-- Use the database
USE online_stor;

-- Show first 10 rows from the sales table
SELECT * FROM sales LIMIT 10;

-- Count total rows in the sales table
SELECT COUNT(*) AS total_rows FROM sales;

-- Calculate total revenue from all sales
SELECT SUM(`Total Revenue`) AS total_revenue
FROM sales;

-- Calculate total revenue per year and month
SELECT 
    YEAR(`Date`) AS year,
    MONTH(`Date`) AS month,
    SUM(`Total Revenue`) AS total_revenue
FROM sales
GROUP BY year, month
ORDER BY year, month;

-- Calculate total revenue per product category and order descending
SELECT `Product Category`, SUM(`Total Revenue`) AS total_revenue
FROM sales
GROUP BY `Product Category`
ORDER BY total_revenue DESC;

-- Calculate total revenue per region and order descending
SELECT Region, SUM(`Total Revenue`) AS total_revenue
FROM sales
GROUP BY Region
ORDER BY total_revenue DESC;

-- Get top 5 products by units sold
SELECT `Product Name`, SUM(`Units Sold`) AS total_units_sold
FROM sales
GROUP BY `Product Name`
ORDER BY total_units_sold DESC
LIMIT 5;

-- Get bottom 5 products by units sold
SELECT `Product Name`, SUM(`Units Sold`) AS total_units_sold
FROM sales
GROUP BY `Product Name`
ORDER BY total_units_sold ASC
LIMIT 5;

-- Count transactions per payment method
SELECT `Payment Method`, COUNT(*) AS total_transactions
FROM sales
GROUP BY `Payment Method`
ORDER BY total_transactions DESC;
