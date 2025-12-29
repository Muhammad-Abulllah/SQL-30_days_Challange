USE sales;

SELECT * FROM transactions;

SELECT product_code, order_date, sales_amount, cost_price,
CASE 
	WHEN cost_price > 70 THEN 'cost price upto 70'
    WHEN order_date BETWEEN '2018-03-09' AND '2018-11-26' THEN '2018 SALES'
END
FROM transactions;

SELECT markets_code, markets_name, zone,
CASE
    WHEN markets_code BETWEEN 'Mark001' AND 'Mark014' THEN 'Market b/w 1 to 14'
    WHEN zone = 'Central' THEN 'Top Zone in Sales'
    ELSE 'The Markets dont in Central Zone and Mark001 to Mark014'
END
FROM markets;