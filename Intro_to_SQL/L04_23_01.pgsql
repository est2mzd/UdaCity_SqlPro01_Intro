WITH T1 AS (
        SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) sum_total
        FROM region r
        JOIN sales_reps s ON r.id = s.region_id
        JOIN accounts a ON a.sales_rep_id = s.id
        JOIN orders o ON o.account_id = a.id
        GROUP BY 1,2
        ORDER BY 3 DESC), 

     T2 AS(
        SELECT T1.region_name, MAX(sum_total) max_total
        FROM T1
        GROUP BY 1
        ORDER BY 2
     )
/*
SELECT *
FROM T2
ORDER BY 2 DESC
*/
SELECT T1.rep_name, T1.region_name, T1.sum_total
FROM T1
JOIN T2 ON T1.region_name = T2.region_name AND T1.sum_total = T2.max_total    
