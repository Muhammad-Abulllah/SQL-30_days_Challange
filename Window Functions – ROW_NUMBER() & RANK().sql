USE sales;
SELECT * FROM (
    SELECT market_code, product_code, sales_amount,
        ROW_NUMBER() OVER(PARTITION BY market_code ORDER BY sales_amount DESC) as rn FROM transactions
) ranked_table
WHERE rn = 1;

SELECT c.custmer_name, SUM(t.sales_amount) as total_spent,
    RANK() OVER(ORDER BY SUM(t.sales_amount) DESC) as rank_n,
    DENSE_RANK() OVER(ORDER BY SUM(t.sales_amount) DESC) as dense_rank_n
FROM transactions t
INNER JOIN customers c ON t.customer_code = c.customer_code
GROUP BY c.custmer_name
LIMIT 10;

WITH Product_Zone_Sales AS (
    SELECT m.zone, p.product_code, SUM(t.sales_amount) as total_revenue
    FROM transactions t
    JOIN markets m ON t.market_code = m.markets_code
    JOIN products p ON t.product_code = p.product_code
    GROUP BY m.zone, p.product_code
),
Ranked_Sales AS (
    SELECT zone, product_code, total_revenue,
        RANK() OVER(PARTITION BY zone ORDER BY total_revenue DESC) as rnk
    FROM Product_Zone_Sales
)
SELECT * FROM Ranked_Sales WHERE rnk <= 2;