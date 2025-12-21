USE sales;
SELECT * FROM  transactions;

SELECT DISTINCT sales_amount FROM transactions; -- Distinct means Unique values

SELECT * FROM transactions ORDER BY order_date; -- by default it sets as ASCENDING order 

SELECT * FROM transactions ORDER BY order_date DESC; -- Now it turns to upper to lower Descending on order date column

SELECT * FROM transactions ORDER BY order_date DESC LIMIT 3; -- Fecth first 3 rows by using LIMIT



