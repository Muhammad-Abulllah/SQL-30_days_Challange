USE sales;

SELECT * FROM date;

SELECT * FROM date WHERE month_name = "July"; -- date is a table name 

SELECT * FROM transactions;

SELECT * FROM transactions WHERE sales_amount > 70; -- show sales greater than 70

SELECT * FROM transactions WHERE sales_amount = 106  ; -- show sales which are equal to 106

SELECT market_code, customer_code, sales_amount FROM transactions WHERE sales_amount <> 106  ; -- show sales which are not equal to 106
