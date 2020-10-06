SELECT  id,
        account_id,
        standard_qty,
        DATE_TRUNC('month', occurred_at) AS month,
        DENSE_RANK() 
            OVER (PARTITION BY account_id )
            AS dense_rank,
        SUM(standard_qty)
            OVER (PARTITION BY account_id )
            AS sum_standard_qty,
        COUNT(standard_qty)
            OVER (PARTITION BY account_id )
            AS count_standard_qty,
        AVG(standard_qty)
            OVER (PARTITION BY account_id )
            AS avg_standard_qty,
        MIN(standard_qty)
            OVER (PARTITION BY account_id )
            AS min_standard_qty,
        MAX(standard_qty)
            OVER (PARTITION BY account_id )
            AS max_standard_qty
FROM orders;