SELECT a.name, 
       CONCAT(a.lat, ',', a.long) AS Coordnate,
       CONCAT(LEFT(a.primary_poc,1), RIGHT(a.primary_poc,1), '@',
              SUBSTR(a.website,5)) AS email_id
FROM accounts a
