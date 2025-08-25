
-- Project: Sales Analysis for Power BI Dashboard
-- Database: MySQL

/* 1. BASIC CHECKS */

-- Preview transactions
SELECT * 
FROM transactions
LIMIT 10;

-- Count total records in each table
SELECT 'transactions' AS table_name, COUNT(*) AS total_records FROM transactions
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'markets', COUNT(*) FROM markets
UNION ALL
SELECT 'date', COUNT(*) FROM date;


/* 2. CUSTOMER ANALYSIS */

-- Sales by customer type (Brick & Mortar vs E-Commerce)
SELECT 
    c.customer_type,
    SUM(t.sales_qty) AS total_sales_qty
FROM transactions t
JOIN customers c 
    ON t.customer_code = c.customer_code
GROUP BY c.customer_type
ORDER BY total_sales_qty DESC;

-- Top 10 customers by sales quantity
SELECT 
    c.custmer_name,
    SUM(t.sales_qty) AS total_sales_qty
FROM transactions t
JOIN customers c 
    ON t.customer_code = c.customer_code
GROUP BY c.custmer_name
ORDER BY total_sales_qty DESC
LIMIT 10;


/* 3. PRODUCT ANALYSIS */

-- Sales by product type
SELECT 
    p.product_type,
    SUM(t.sales_qty) AS total_sales_qty
FROM transactions t
JOIN products p 
    ON t.product_code = p.product_code
GROUP BY p.product_type
ORDER BY total_sales_qty DESC;

-- Top 10 best-selling products
SELECT 
    p.product_code,
    p.product_type,
    SUM(t.sales_qty) AS total_sales_qty
FROM transactions t
JOIN products p 
    ON t.product_code = p.product_code
GROUP BY p.product_code, p.product_type
ORDER BY total_sales_qty DESC
LIMIT 10;


/* 4. TIME ANALYSIS */

-- Monthly sales trend
SELECT 
    d.year,
    d.month_name,
    SUM(t.sales_qty) AS total_sales_qty
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
GROUP BY d.year, d.month_name
ORDER BY d.year, MIN(d.date);

-- Yearly sales trend
SELECT 
    d.year,
    SUM(t.sales_qty) AS total_sales_qty
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
GROUP BY d.year
ORDER BY d.year;


/* 5. MARKET ANALYSIS */

-- Sales by market
SELECT 
    m.markets_name,
    SUM(t.sales_qty) AS total_sales_qty
FROM transactions t
JOIN markets m 
    ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY total_sales_qty DESC;

-- Sales by zone
SELECT 
    m.zone,
    SUM(t.sales_qty) AS total_sales_qty
FROM transactions t
JOIN markets m 
    ON t.market_code = m.markets_code
GROUP BY m.zone
ORDER BY total_sales_qty DESC;


/* 6. COMBINED ANALYSIS */

-- Customer type performance across years
SELECT 
    d.year,
    c.customer_type,
    SUM(t.sales_qty) AS total_sales_qty
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
JOIN customers c
    ON t.customer_code = c.customer_code
GROUP BY d.year, c.customer_type
ORDER BY d.year, total_sales_qty DESC;

-- Product performance across zones
SELECT 
    m.zone,
    p.product_type,
    SUM(t.sales_qty) AS total_sales_qty
FROM transactions t
JOIN products p 
    ON t.product_code = p.product_code
JOIN markets m
    ON t.market_code = m.markets_code
GROUP BY m.zone, p.product_type
ORDER BY m.zone, total_sales_qty DESC;

-- Top customers in each year
SELECT 
    d.year,
    c.custmer_name,
    SUM(t.sales_qty) AS total_sales_qty
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
JOIN customers c
    ON t.customer_code = c.customer_code
GROUP BY d.year, c.custmer_name
ORDER BY d.year, total_sales_qty DESC;
