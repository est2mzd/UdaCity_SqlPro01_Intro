SELECT  id,
        account_id,
        standard_qty,
        DATE_TRUNC('month', occurred_at) AS month,
        DENSE_RANK() 
            OVER (PARTITION BY account_id ORDER BY NULL)
            AS dense_rank,
        SUM(standard_qty)
            OVER (PARTITION BY account_id ORDER BY NULL)
            AS sum_standard_qty,
        COUNT(standard_qty)
            OVER (PARTITION BY account_id ORDER BY NULL)
            AS count_standard_qty,
        AVG(standard_qty)
            OVER (PARTITION BY account_id ORDER BY NULL)
            AS avg_standard_qty,
        MIN(standard_qty)
            OVER (PARTITION BY account_id ORDER BY NULL)
            AS min_standard_qty,
        MAX(standard_qty)
            OVER (PARTITION BY account_id ORDER BY NULL)
            AS max_standard_qty
FROM orders;


/*
SELECT occurred_at, DATE_TRUNC('month', occurred_at)
FROM orders

SELECT timezone('JST', occurred_at::timestamptz)
FROM orders

\x
SELECT DATE_TRUNC('month',timezone('JST', occurred_at::timestamptz))
FROM orders

SELECT to_chat(occurred_at, 'YYYY/MM/DD')
FROM orders
*/