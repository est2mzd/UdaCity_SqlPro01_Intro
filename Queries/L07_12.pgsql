SELECT * FROM accounts
UNION ALL
SELECT * FROM accounts



SELECT * FROM accounts WHERE name = 'Walmart'
UNION ALL
SELECT * FROM accounts WHERE name = 'Disney'



SELECT name, COUNT(name)
FROM(
        SELECT * FROM accounts
        UNION ALL
        SELECT * FROM accounts
    ) double_accounts
GROUP BY 1
ORDER BY 2 DESC  