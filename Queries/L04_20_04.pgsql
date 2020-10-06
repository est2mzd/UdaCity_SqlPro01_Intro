SELECT a.id, a.name, SUM(o.total_amt_usd)
FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY 1,2
ORDER BY 1 DESC
LIMIT 1


SELECT a.name, w.channel , COUNT(*)
FROM web_events w
JOIN accounts a 
ON w.account_id = a.id 
   AND a.id = (
                SELECT id
                FROM(
                        SELECT a.id, a.name, SUM(o.total_amt_usd)
                        FROM accounts a
                        JOIN orders o ON a.id = o.account_id
                        GROUP BY 1,2
                        ORDER BY 3 DESC
                        LIMIT 1 
                ) AS T1
        )
GROUP BY 1,2
ORDER BY 3 DESC



