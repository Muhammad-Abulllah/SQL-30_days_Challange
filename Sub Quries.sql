USE sales;
SELECT * FROM transactions;
SELECT * FROM customers;

SELECT product_code, customer_code FROM transactions WHERE cost_price > 
(SELECT AVG(cost_price) AS Average_cost FROM transactions);



SELECT product_code, sales_amount FROM transactions 
WHERE customer_code IN 
(SELECT customer_code FROM customers WHERE customer_type = 'E-Commerce');


SELECT * FROM transactions;

SELECT 
    c.custmer_name,
    AVG(t.sales_amount) AS avg_purchase_value
FROM customers c
JOIN transactions t 
    ON c.customer_code = t.customer_code
GROUP BY c.custmer_name
HAVING AVG(t.sales_amount) > (
    -- Overall Average in sales
    SELECT AVG(sales_amount) FROM transactions
)


