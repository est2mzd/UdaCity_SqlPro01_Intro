SELECT account_id,
       occurred_at,
       standard_qty, 
       NTILE(4) OVER(PARTITION BY account_id ORDER BY standard_qty) as standart_quartile
FROM orders
ORDER BY account_id DESC



SELECT account_id, 
       occurred_at, 
       gloss_qty,
       NTILE(2) OVER(PARTITION BY account_id ORDER BY gloss_qty) as gloss_hafl
FROM orders
ORDER BY account_id DESC


SELECT account_id, 
       occurred_at, 
       total_amt_usd,
       NTILE(100) OVER(PARTITION BY account_id ORDER BY total_amt_usd) as total_percentile
FROM orders
ORDER BY account_id DESC