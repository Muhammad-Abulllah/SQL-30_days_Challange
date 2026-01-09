USE sales;
SELECT * FROM transactions;
SELECT * FROM markets;
-- Join the transactions and markets
SELECT 
    m.zone,
    m.markets_name,
    SUM(t.sales_qty) AS total_units_sold
FROM markets m
INNER JOIN transactions t 
    ON m.markets_code = t.market_code
GROUP BY m.zone, m.markets_name
ORDER BY total_units_sold DESC;

-- Elite products in our data
SELECT DISTINCT product_code 
FROM transactions
WHERE sales_amount > (
    SELECT AVG(sales_amount) FROM transactions
);

-- Customer Name and their Contribution % to our total revenue
WITH Customer_Spending AS (
    SELECT c.custmer_name, SUM(t.sales_amount) AS total_spent
    FROM transactions t
    INNER JOIN customers c 
        ON t.customer_code = c.customer_code
    GROUP BY c.custmer_name
)
SELECT custmer_name, total_spent,
    (total_spent / (SELECT SUM(sales_amount) FROM transactions)) * 100 AS contribution_pct
FROM Customer_Spending
ORDER BY contribution_pct DESC;


SELECT DISTINCT t.product_code 
FROM transactions t
INNER JOIN markets m 
    ON t.market_code = m.markets_code
WHERE m.markets_name = 'Chennai'; 
-- If you know the code than write 'Mark001'

