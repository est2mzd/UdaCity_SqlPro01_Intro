
SELECT a.name account_name, SUM(o.standard_qty) total_std, SUM(o.total) total
FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;



SELECT a.name
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY 1
HAVING SUM(o.total) > 
        (SELECT total 
         FROM (
                SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                FROM accounts a
                JOIN orders o
                ON o.account_id = a.id
                GROUP BY 1
                ORDER BY 2 DESC
                LIMIT 1
                ) sub
        );

SELECT COUNT(*)
FROM (SELECT a.name
       FROM orders o
       JOIN accounts a
       ON a.id = o.account_id
       GROUP BY 1
       HAVING SUM(o.total) > (SELECT total 
                   FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                         FROM accounts a
                         JOIN orders o
                         ON o.account_id = a.id
                         GROUP BY 1
                         ORDER BY 2 DESC
                         LIMIT 1) inner_tab)
             ) counter_tab;














































