WITH T1 AS(
    SELECT
        CASE WHEN LEFT(UPPER(name),1) IN ('0','1','2','3','4','5','6','7','8','9')
            THEN 1.0
            ELSE 0.0
        END AS num
    FROM accounts),
 T2 AS(
    SELECT
        CASE WHEN LEFT(UPPER(name),1) IN ('0','1','2','3','4','5','6','7','8','9')
            THEN 0.0
            ELSE 1.0
        END AS num
    FROM accounts),
 T3 AS(
    SELECT SUM(T2.num)/(SUM(T1.num)+SUM(T2.num)) AS ratio
    FROM T1, T2)

SELECT ratio
FROM T3