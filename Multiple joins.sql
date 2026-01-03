-- This connecting Transactions, Customers, Products and Markets 
SELECT 
    c.custmer_name,
    p.product_type,
    m.markets_name,
    t.sales_amount,
    t.profit_margin
FROM transactions t
INNER JOIN customers c 
    ON t.customer_code = c.customer_code
INNER JOIN products p 
    ON t.product_code = p.product_code
INNER JOIN markets m 
    ON t.market_code = m.markets_code
LIMIT 10;

SELECT 
    m.zone,
    p.product_type,
    SUM(t.sales_qty) AS total_units_sold
FROM transactions t
INNER JOIN markets m 
    ON t.market_code = m.markets_code
INNER JOIN products p 
    ON t.product_code = p.product_code
GROUP BY m.zone, p.product_type
ORDER BY m.zone, total_units_sold DESC; -- We join transactions + markets + products