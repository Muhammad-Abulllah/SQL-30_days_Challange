USE sales;
SELECT * FROM transactions;
SELECT MAX(cost_price) AS MAX_Cost_Price, order_date FROM transactions GROUP BY order_date;
-- We can Apply All Aggregation functions on that on the basis of what we need from data
SELECT SUM(cost_price) AS Total_Cost_Price, order_date FROM transactions GROUP BY order_date;

SELECT MAX(cost_price), product_code FROM transactions
GROUP BY product_code;
-- Shows the products which have Maximum Cost prices in Market
