SELECT COUNT(a.id)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id