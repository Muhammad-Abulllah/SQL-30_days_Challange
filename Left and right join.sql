USE sales;
SELECT * FROM customers;

SELECT 
    t.sales_amount,
    m.markets_name
FROM markets m
RIGHT JOIN transactions t 
    ON m.markets_code = t.market_code;

SELECT 
    p.product_code,
    p.product_type
FROM products p
LEFT JOIN transactions t 
    ON p.product_code = t.product_code 
    AND t.market_code = 'Mark001'
WHERE t.sales_qty IS NULL;


SELECT * FROM date;
SELECT
    d.date,
    DAYNAME(d.date) AS day_name,
    MONTHNAME(d.date) AS month_name
FROM date d
LEFT JOIN transactions t
    ON d.date = t.order_date
WHERE t.sales_amount IS NULL
LIMIT 1000;
