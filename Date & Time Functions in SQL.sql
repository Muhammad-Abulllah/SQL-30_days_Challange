USE sales;
SELECT order_date,
    YEAR(order_date) AS report_year,
    MONTHNAME(order_date) AS report_month,
    DAY(order_date) AS day_of_month,
    WEEKOFYEAR(order_date) AS week_num
FROM transactions
LIMIT 10;

SELECT 
    COUNT(*) AS total_orders,
    SUM(sales_amount) AS q1_revenue
FROM transactions
WHERE order_date BETWEEN '2020-01-01' AND '2020-03-31';

SELECT 
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    SUM(sales_amount) AS total_revenue
FROM transactions
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY sales_year DESC, sales_month DESC;


SELECT customer_code, order_date,
    '2020-06-30' AS fiscal_end,
    DATEDIFF('2020-06-30', order_date) AS days_until_close
FROM transactions
WHERE year(order_date) = 2020
LIMIT 10;