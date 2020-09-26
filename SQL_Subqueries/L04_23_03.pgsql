WITH T1 AS (
    SELECT a.name, SUM(o.standard_qty) total_std, SUM(o.total) total
    FROM region r
    JOIN sales_reps s ON s.region_id = r.id
    JOIN accounts a ON a.sales_rep_id = s.id
    JOIN orders o ON o.account_id = a.id
    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT 1),
 T2 AS(
     SELECT a.name account_name
     FROM accounts a
     JOIN orders o ON o.account_id = a.id
     GROUP BY 1
     HAVING SUM(o.total) > (SELECT total FROM T1))

SELECT COUNT(account_name)
FROM T2;
