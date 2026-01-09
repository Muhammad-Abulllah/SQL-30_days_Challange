USE sales;
SELECT * FROM transactions;

WITH Monthly_Sales AS (
    SELECT YEAR(order_date) as year, MONTH(order_date) as month, SUM(sales_amount) as current_revenue
    FROM transactions
    GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT year, month, current_revenue,
    LAG(current_revenue) OVER(ORDER BY year, month) as previous_revenue,
    ((current_revenue - LAG(current_revenue) OVER(ORDER BY year, month)) / 
      LAG(current_revenue) OVER(ORDER BY year, month)) * 100 as growth_pct
FROM Monthly_Sales;

SELECT product_code, order_date, sales_qty,
    LAG(sales_qty) OVER(PARTITION BY product_code ORDER BY order_date) as     		 previous_day_qty,
    (sales_qty - LAG(sales_qty) OVER(PARTITION BY product_code ORDER BY order_date)) as diff
FROM transactions
WHERE product_code = 'Prod040'
ORDER BY order_date;

SELECT customer_code, order_date,
    LEAD(order_date) OVER(PARTITION BY customer_code ORDER BY order_date) as next_order_date,
    DATEDIFF(
        LEAD(order_date) OVER(PARTITION BY customer_code ORDER BY order_date), 
        order_date
    ) as days_until_next_order
FROM transactions
WHERE customer_code = 'Cus001'
ORDER BY order_date;