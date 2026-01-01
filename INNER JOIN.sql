USE sales;
SELECT * FROM transactions;
SELECT * FROM products;

SELECT 
    t.order_date,
    c.custmer_name,  -- Coming from customers table
    c.customer_type,
    t.sales_amount   -- Coming from transactions table
FROM transactions t
INNER JOIN customers c
    ON t.customer_code = c.customer_code;

SELECT 
    p.product_code,
    p.product_type, -- Coming from products table
    SUM(t.sales_qty) as total_quantity_sold
FROM transactions t
INNER JOIN products p 
    ON t.product_code = p.product_code
GROUP BY p.product_code, p.product_type;


SELECT 
    p.product_code, -- Coming from products table
    p.product_type, 
    SUM(t.sales_qty) as total_quantity_sold
FROM transactions t
INNER JOIN products p 
    ON t.product_code = p.product_code
GROUP BY p.product_code, p.product_type;
