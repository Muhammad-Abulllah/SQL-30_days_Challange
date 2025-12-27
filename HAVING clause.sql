USE sales;
SELECT * FROM transactions;

SELECT product_code, AVG(profit_margin) FROM transactions GROUP BY product_code HAVING AVG(profit_margin) > 40; -- Show the Average profit margin that is greater than 40 by grouped through product_code


SELECT product_code,SUM(cost_price) AS Total_cost_price FROM transactions GROUP BY product_code HAVING SUM(cost_price) > 20000 
ORDER BY SUM(cost_price);
-- In which we look our SUM of Cost Price and grouped by the Product


SELECT * FROM sales.transactions;

SELECT product_code, SUM(sales_amount) AS Total_Sales FROM transactions
WHERE product_code LIKE ('%294%')
GROUP BY product_code HAVING SUM(sales_amount) > 100;
-- This query takes product 294 on which the sales greater than 100 and grouped the product_code 
