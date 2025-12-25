USE sales;

SELECT * FROM transactions;

SELECT MIN(cost_price) AS Minimun_cost_price FROM transactions;

SELECT MAX(cost_price) AS Maximum_cost_price FROM transactions WHERE profit_margin_percentage > '0.38';

SELECT COUNT(sales_qty) FROM transactions WHERE sales_amount > '30';

SELECT SUM(cost_price)
FROM transactions 
WHERE product_code = 'Prod295';
