SELECT * FROM transactions 
WHERE profit_margin <= 0;
-- Check for negative or zero sales amounts
SELECT DISTINCT(currency) FROM transactions;
-- Check for transactions in foreign currencies

SELECT * FROM markets 
WHERE zone = '' OR zone IS NULL;
-- Identify "garbage" markets


DELETE FROM markets 
WHERE markets_code IN ('Mark097', 'Mark999');
-- Remove Those market Records Market Records


SET SQL_SAFE_UPDATES = 0; -- We can off this first

UPDATE transactions 
SET sales_amount = sales_amount * 75, 
    currency = 'INR' 
WHERE currency = 'USD' OR currency = 'US Dollar';

SET SQL_SAFE_UPDATES = 1; -- Turn on for Safety Purpose


