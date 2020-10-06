WITH T1 AS(
    SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
    FROM orders o
    JOIN accounts a ON a.id = o.account_id
    JOIN web_events w ON w.account_id = a.id
    GROUP BY 1,2
    ORDER BY 3 DESC
    LIMIT 1)

SELECT a.name, w.channel, COUNT(*)
FROM accounts a
JOIN web_events w ON w.account_id = a.id
GROUP BY 1,2
HAVING a.name = (SELECT name FROM T1)
ORDER BY 3 DESC
