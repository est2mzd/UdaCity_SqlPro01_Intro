WITH T1 AS(
      SELECT r.name region_name, SUM(o.total_amt_usd) sum_total
      FROM region r
      JOIN sales_reps s ON r.id = s.region_id
      JOIN accounts a ON a.sales_rep_id = s.id
      JOIN orders o ON o.account_id = a.id
      GROUP BY 1
      ORDER BY 2 DESC),
     
     T2 AS(
        SELECT region_name, MAX(sum_total) max_total
        FROM T1
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT 1
        )

SELECT r.name, COUNT(o.total) total_orders
FROM region r
JOIN sales_reps s ON r.id = s.region_id
JOIN accounts a ON a.sales_rep_id = s.id
JOIN orders o ON o.account_id = a.id
JOIN T1 ON r.name = T1.region_name
JOIN T2 ON r.name = T2.region_name
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (SELECT max_total FROM T2)