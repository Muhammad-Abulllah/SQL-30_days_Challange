USE sales;

SELECT * FROM transactions;

SELECT * FROM transactions WHERE product_code IN ('Prod294', 'Prod281', 'Prod056');
-- Show transactions for Products

SELECT * FROM sales.markets;

SELECT * FROM markets WHERE zone NOT IN ('NORTH', 'CENTRAL');
-- Show markets which is not from  NORTH AND CENTERAL

SELECT * FROM customers
WHERE customer_code IN (SELECT customer_code FROM transactions);
-- In this Sub query we tackle our customers by their code from transactions and customers table



SELECT * FROM transactions;

SELECT * FROM transactions
WHERE cost_price BETWEEN 60 AND 80; -- Gives the prices under 60 to 80

SELECT * FROM transactions
WHERE cost_price NOT BETWEEN 60 AND 80; -- give the cost_price which are not under 60 to 80
