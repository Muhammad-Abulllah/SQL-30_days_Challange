USE sales;
WITH Market_Sales AS (
    SELECT market_code, SUM(sales_amount) AS total_revenue FROM transactions
    GROUP BY market_code
),
Average_Benchmark AS (
    SELECT AVG(total_revenue) AS avg_market_revenue FROM Market_Sales
)
SELECT m.market_code, m.total_revenue, b.avg_market_revenue FROM Market_Sales m
JOIN Average_Benchmark b 
ON m.total_revenue < b.avg_market_revenue;


WITH Sales_2020 AS (
    SELECT t.customer_code, t.sales_amount FROM transactions t
    INNER JOIN date d
    ON t.order_date = d.date
    WHERE d.year = 2020
),
Customer_Totals AS (
    SELECT customer_code, SUM(sales_amount) AS total_spent FROM Sales_2020
    GROUP BY customer_code
)
SELECT c.custmer_name, ct.total_spent FROM Customer_Totals ct
INNER JOIN customers c
    ON ct.customer_code = c.customer_code
ORDER BY ct.total_spent DESC
LIMIT 5;


WITH Market_Averages AS (
    SELECT market_code, AVG(sales_amount) AS avg_sales FROM transactions 
    GROUP BY market_code
)
SELECT t.market_code, t.sales_amount, ma.avg_sales FROM transactions t
INNER JOIN Market_Averages ma 
    ON t.market_code = ma.market_code
WHERE t.sales_amount > ma.avg_sales
LIMIT 10;