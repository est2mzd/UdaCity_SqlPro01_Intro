SELECT  date AS orig_date,
        CONCAT( SUBSTR(date,7,4), '-',
               SUBSTR(date,1,2), '-',
               SUBSTR(date,4,2)) AS new_date
FROM sf_crime_data
LIMIT 10;