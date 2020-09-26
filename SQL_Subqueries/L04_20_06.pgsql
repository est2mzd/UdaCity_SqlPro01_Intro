SELECT AVG(o.total_amt_usd) avg_all
FROM orders o



SELECT o.account_id, AVG(o.total_amt_usd) avg_selected
FROM orders o
GROUP BY 1
HAVING AVG(o.total_amt_usd) > (
                SELECT AVG(o.total_amt_usd) avg_all
                FROM orders o    
                )
ORDER BY 2 DESC          



SELECT AVG(avg_selected)
FROM(
        SELECT o.account_id, AVG(o.total_amt_usd) avg_selected
        FROM orders o
        GROUP BY 1
        HAVING AVG(o.total_amt_usd) > (
                        SELECT AVG(o.total_amt_usd) avg_all
                        FROM orders o    
                        )
        ORDER BY 2 DESC         
        ) AS T1