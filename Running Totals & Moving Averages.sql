USE sales;
SELECT * FROM transactions;
SELECT
	sales_amount,
    YEAR(order_date),
    LEAD(YEAR(order_date)) OVER (ORDER BY sales_amount asc) lead_sales,
    LAG(YEAR(order_date)) OVER (ORDER BY sales_amount asc) lag_sales
FROM transactions;





SELECT
	sales_amount,
    YEAR(order_date),
    LAG(YEAR(order_date), 1, 0) OVER (ORDER BY sales_amount asc) Sales_1_before,
    LAG(YEAR(order_date), 2, 0) OVER (ORDER BY sales_amount asc) Sales_2_before,
    LAG(YEAR(order_date), 3, 0) OVER (ORDER BY sales_amount asc) lag_3_before
FROM transactions;

SELECT 
    YEAR(order_date),
    sales_amount,
    SUM(sales_amount) OVER (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM transactions
WHERE market_code = 'Mark001' AND YEAR(order_date) = 2020
ORDER BY order_date;

SELECT YEAR(order_date) AS YEAR,
    sales_qty,
    AVG(sales_qty) OVER (
        ORDER BY order_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_7_day
FROM transactions
WHERE product_code = 'Prod040'
ORDER BY order_date;

SELECT 
    YEAR(order_date) as year, order_date,
    sales_amount,
    SUM(sales_amount) OVER (
        PARTITION BY YEAR(order_date) 
        ORDER BY order_date
    ) AS ytd_sales
FROM transactions
WHERE customer_code = 'Cus005'
ORDER BY order_date;

    
    