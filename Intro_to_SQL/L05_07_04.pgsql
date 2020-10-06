WITH T1 AS(
    SELECT 
        CASE WHEN LEFT(UPPER(name),1) IN ('A','I','U','E','O')
            THEN 1.0
            ELSE 0.0
        END AS num
    FROM accounts),
 T2 AS (
    SELECT 
        CASE WHEN LEFT(UPPER(name),1) IN ('A','I','U','E','O')
            THEN 0.0
            ELSE 1.0
        END AS num
    FROM accounts)

SELECT SUM(T2.num) / (SUM(T1.num) + SUM(T2.num)) * 100.0
FROM T1, T2


SELECT SUM(vowels) vowels, SUM(other) other
FROM (SELECT name, 
            CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                THEN 1 ELSE 0 END AS vowels, 
             CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                THEN 0 ELSE 1 END AS other
            FROM accounts) t1;
