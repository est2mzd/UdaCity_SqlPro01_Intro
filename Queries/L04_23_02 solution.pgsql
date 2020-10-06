WITH T1 AS (
    SELECT r.name, SUM(o.total_amt_usd) total_amt
    FROM region r
    JOIN sales_reps s ON s.region_id = r.id
    JOIN accounts a ON a.sales_rep_id = s.id
    JOIN orders o ON o.account_id = a.id
    GROUP BY 1),
    
 T2 AS (
    SELECT MAX(total_amt)
    FROM T1)

SELECT r.name, COUNT(total) total_orders
FROM region r
JOIN sales_reps s ON s.region_id = r.id
JOIN accounts a ON a.sales_rep_id = s.id
JOIN orders o ON o.account_id = a.id
GROUP BY 1
HAVING SUM(o.total_amt_usd) = (SELECT max FROM T2)