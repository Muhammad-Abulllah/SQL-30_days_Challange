SELECT * FROM customers WHERE customer_type IS NULL;
-- Show Null values which are present in our customer column table


INSERT INTO transactions (product_code, customer_code, market_code, order_date, sales_qty, sales_amount, currency, profit_margin_percentage, profit_margin, cost_price)
VALUES ('Prod271', NULL, 'Mark011', '2019-07-01', '1', '65', 'INR', NULL, NULL, NULL);

SELECT * FROM date WHERE cy_date IS NOT NULL;
-- Exclude Null Values

SELECT COUNT(*) - COUNT(cost_price) AS null_count_year FROM transactions;

SELECT 
    COUNT(*) AS total_rows,
    COUNT(sales_amount) AS non_null_amounts
FROM transactions;