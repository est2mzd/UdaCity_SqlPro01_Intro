SELECT account_id, SUM(standard_qty) AS standard_sum
FROM orders
GROUP BY 1


SELECT account_id, standard_sum
FROM (
      SELECT account_id, SUM(standard_qty) AS standard_sum
      FROM orders
      GROUP BY 1
     ) sub


SELECT account_id, 
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag
FROM (
      SELECT account_id, SUM(standard_qty) AS standard_sum
      FROM orders
      GROUP BY 1
     ) sub


SELECT account_id, 
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag,
       standard_sum - LAG(standard_sum) OVER(ORDER BY standard_sum) AS lag_diff
FROM (
      SELECT account_id, SUM(standard_qty) AS standard_sum
      FROM orders
      GROUP BY 1
     ) sub     