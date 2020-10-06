
SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt_usd
FROM sales_reps s
JOIN accounts a ON s.id = a.sales_rep_id
JOIN orders o ON a.id = o.account_id
JOIN region r ON r.id = s.region_id
GROUP BY 1,2


SELECT T1.region_name, MAX(T1.total_amt_usd)
FROM (
    SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt_usd
    FROM sales_reps s
    JOIN accounts a ON s.id = a.sales_rep_id
    JOIN orders o ON a.id = o.account_id
    JOIN region r ON r.id = s.region_id
    GROUP BY 1,2
    ) AS T1
GROUP BY 1
ORDER BY 2 DESC;    


SELECT T3.rep_name, T3.region_name, T3.total_amt
FROM(
    SELECT T1.region_name, MAX(T1.total_amt) total_amt
    FROM (
        SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
        FROM sales_reps s
        JOIN accounts a ON s.id = a.sales_rep_id
        JOIN orders o ON a.id = o.account_id
        JOIN region r ON r.id = s.region_id
        GROUP BY 1,2
        ) AS T1
    GROUP BY 1
    ) AS T2
JOIN (
    SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
    FROM sales_reps s
    JOIN accounts a ON s.id = a.sales_rep_id
    JOIN orders o ON a.id = o.account_id
    JOIN region r ON r.id = s.region_id
    GROUP BY 1,2
    ) AS T3
ON T3.region_name = T2.region_name AND T3.total_amt = T2.total_amt;














































