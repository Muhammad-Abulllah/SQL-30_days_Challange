USE sales;
-- BAD Fetches unnecessary data
SELECT * FROM customers c
JOIN transactions t ON c.customer_code = t.customer_code
WHERE t.sales_qty > 100;

-- GOOD Fetches only what is needed
SELECT c.custmer_name 
FROM customers c
JOIN transactions t ON c.customer_code = t.customer_code
WHERE t.sales_qty > 100;

-- BAD (Function on the column)
SELECT count(*) FROM transactions 
WHERE YEAR(order_date) = 2020;

-- GOOD (Range on the column)
SELECT count(*) FROM transactions 
WHERE order_date BETWEEN '2020-01-01' AND '2020-12-31';

-- BAD (Aggregates everything, then filters)
SELECT market_code, SUM(sales_amount) 
FROM transactions
GROUP BY market_code
HAVING market_code = 'Mark001';

-- GOOD (Filters first, then aggregates)
SELECT market_code, SUM(sales_amount) 
FROM transactions
WHERE market_code = 'Mark001'
GROUP BY market_code;

-- BAD (Can be slow with large lists)
SELECT product_code FROM products
WHERE product_code IN (SELECT product_code FROM transactions);

-- GOOD (Stops at first match)
SELECT p.product_code FROM products p
WHERE EXISTS (
    SELECT 1 FROM transactions t 
    WHERE t.product_code = p.product_code
);
