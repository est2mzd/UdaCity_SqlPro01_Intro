/*
SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
FROM region r
JOIN sales_reps s ON r.id = s.region_id
JOIN accounts a ON a.sales_rep_id = s.id
JOIN orders o ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC
*/

/*
SELECT MAX(T1.total_amt)
FROM (
    SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
    FROM region r
    JOIN sales_reps s ON r.id = s.region_id
    JOIN accounts a ON a.sales_rep_id = s.id
    JOIN orders o ON o.account_id = a.id
    GROUP BY 1    
    ) AS T1
*/

SELECT r.name region_name, COUNT(o.total) sum_total
FROM region r
JOIN sales_reps s ON r.id = s.region_id
JOIN accounts a ON a.sales_rep_id = s.id
JOIN orders o ON o.account_id = a.id
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (
    SELECT MAX(T1.total_amt)
    FROM (
        SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
        FROM region r
        JOIN sales_reps s ON r.id = s.region_id
        JOIN accounts a ON a.sales_rep_id = s.id
        JOIN orders o ON o.account_id = a.id
        GROUP BY 1    
        ) AS T1
    )