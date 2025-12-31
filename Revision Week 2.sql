USE sales;
SELECT * FROM transactions;

SELECT COUNT(*) AS total_transactions 
FROM transactions;

SELECT SUM(sales_amount) AS total_revenue
FROM transactions;

SELECT AVG(profit_margin_percentage) AS average_margin FROM transactions;

SELECT MIN(sales_qty) AS min_quantity,
MAX(sales_qty) AS max_quantity FROM transactions;



SELECT market_code, SUM(sales_amount) AS total_sales
FROM transactions GROUP BY market_code; 



SELECT customer_type, COUNT(*) AS customer_count FROM customers
GROUP BY customer_type;


SELECT market_code, SUM(sales_amount) AS total_sales
FROM transactions
WHERE order_date >= '2020-01-01'
GROUP BY market_code
HAVING SUM(sales_amount) > 5000000;

SELECT product_code, sales_amount, profit_margin,
CASE
	WHEN profit_margin > 500 THEN "High Profit"
    WHEN profit_margin > 0 THEN "Low Profit"
    WHEN profit_margin = 0 THEN "Break Even"
    ELSE "Loss"
END AS Profit_Status
FROM transactions;
    




