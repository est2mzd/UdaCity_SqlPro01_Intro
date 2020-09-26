WITH EXT AS (
    SELECT RIGHT(website, 3) AS extension
    FROM accounts
)

SELECT extension, COUNT(*)
FROM EXT
GROUP BY 1




SELECT RIGHT(website, 3) AS Domain, COUNT(*) num
FROM accounts
GROUP BY 1
ORDER BY 2 DESC