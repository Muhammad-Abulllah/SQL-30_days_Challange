USE sales;
SELECT * FROM transactions;

SELECT product_code,sales_amount,profit_margin,order_date FROM transactions WHERE product_code = 'Prod292' AND order_date LIKE '2020'; -- This query retrieves our selected columns based on Prod292 product_code and order_date which starts from 2020

SELECT customer_code, sales_amount, cost_price FROM transactions WHERE sales_amount = 65 OR cost_price > '100'; -- In OR Statement display record if one condition is True



