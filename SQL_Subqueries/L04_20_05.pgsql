SELECT AVG(T1.sum_usd)
FROM(
        SELECT a.name, SUM(o.total_amt_usd) sum_usd
        FROM accounts a
        JOIN orders o ON a.id = o.account_id
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT 10
        ) AS T1
