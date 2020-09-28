SELECT CONCAT( 
        LEFT( primary_poc, STRPOS(primary_poc, ' ')-1), '.',
        RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')), '@',
        name, '.com')
FROM accounts


