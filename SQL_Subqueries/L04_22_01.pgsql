SELECT w.channel, DATE_TRUNC('day', w.occurred_at) as day , COUNT(*) as events
FROM web_events w
GROUP BY 1,2
ORDER BY 2


SELECT channel, AVG(events) AS average_events_per_day
FROM(
        SELECT w.channel, DATE_TRUNC('day', w.occurred_at) as day , COUNT(*) as events
        FROM web_events w
        GROUP BY 1,2   
        ) AS T1
GROUP BY 1
ORDER BY 2 DESC        

/* with */

WITH events AS (
        SELECT w.channel, DATE_TRUNC('day', w.occurred_at) as day , COUNT(*) as events
        FROM web_events w
        GROUP BY 1,2
        ORDER BY 2        
)

SELECT channel, AVG(events) AS average_events_per_day
FROM events
GROUP BY 1
ORDER BY 2 DESC
