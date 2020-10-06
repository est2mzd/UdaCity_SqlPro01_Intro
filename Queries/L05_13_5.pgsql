WITH T1 AS(
    SELECT  date AS orig_date,
            CONCAT( SUBSTR(date,7,4), '-',
                SUBSTR(date,1,2), '-',
                SUBSTR(date,4,2)) AS new_date
    FROM sf_crime_data)

SELECT orig_date, CAST(new_date as date)
FROM T1
LIMIT 10