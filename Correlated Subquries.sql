USE sales;
SELECT * FROM transactions ORDER BY customer_code;
SELECT * FROM customers;

SELECT c.customer_code, c.custmer_name
FROM customers c
WHERE (
    SELECT COUNT(*) 
    FROM transactions t 
    WHERE t.customer_code = c.customer_code
) > 100;





SELECT m.markets_name, m.zone
FROM markets m
WHERE (
    SELECT AVG(t.profit_margin) 
    FROM transactions t 
    WHERE t.market_code = m.markets_code
) < 0;









