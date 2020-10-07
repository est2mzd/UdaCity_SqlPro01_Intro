EXPLAIN
SELECT * 
FROM web_events
WHERE   occurred_at >= '2016-01-01'
    AND occurred_at <  '2016-02-01'
LIMIT 100