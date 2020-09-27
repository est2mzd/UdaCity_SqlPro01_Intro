SELECT CONCAT(account_id, '_', channel, '_', COUNT(*))
FROM web_events
GROUP BY account_id, channel



WITH T1 AS (
    SELECT account_id, channel, COUNT(*)
    FROM web_events
    GROUP BY 1,2
    ORDER BY 1)

SELECT CONCAT(account_id, '_', channel, '_', count)
FROM T1