WITH T1 AS (
    SELECT LEFT( primary_poc, STRPOS(primary_poc, ' ')-1) first_name,
           RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name,
           REPLACE(name, ' ', '')  mod_name
    FROM accounts),
 T2 AS(
     SELECT LEFT(LOWER(first_name),1)  s1, 
            RIGHT(LOWER(first_name),1) s2,
            LEFT(LOWER(last_name),1)   s3, 
            RIGHT(LOWER(last_name),1)  s4, 
            LENGTH(first_name) num1,
            LENGTH(last_name)  num2,
            mod_name comp_name
     FROM T1
 )

SELECT CONCAT(s1,s2,s3,s4,num1,num2,comp_name)
FROM T2


WITH t1 AS (
    SELECT LEFT( primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name,  
           RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, 
           name
    FROM accounts)

SELECT first_name, 
       last_name, 
       CONCAT(first_name, '.', last_name, '@', name, '.com'), 
       LEFT(LOWER(first_name), 1) || 
            RIGHT(LOWER(first_name), 1) || 
            LEFT(LOWER(last_name), 1) || 
            RIGHT(LOWER(last_name), 1) || 
            LENGTH(first_name) || 
            LENGTH(last_name) || 
            REPLACE(UPPER(name), ' ', '')
FROM t1;