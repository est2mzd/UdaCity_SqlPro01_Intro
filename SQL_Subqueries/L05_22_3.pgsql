SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, 
       a.primary_poc, a.sales_rep_id, 
       COALESCE(o.account_id, a.id) account_id, o.occurred_at, o.standard_qty, 
       o.gloss_qty, o.poster_qty, o.total, o.standard_amt_usd, o.gloss_amt_usd, 
       o.poster_amt_usd, o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;