WITH T1 AS(
    SELECT a.id, a.name, SUM(o.total_amt_usd) sum_total
    FROM orders o
    JOIN accounts a ON a.id = o.account_id
    GROUP BY 1,2
    ORDER BY 3 DESC
    LIMIT 10)

SELECT AVG(sum_total)
FROM T1