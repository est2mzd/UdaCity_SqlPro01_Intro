SELECT *
FROM accounts AS a
FULL JOIN sales_reps AS s ON a.sales_rep_id = s.id
WHERE a.sales_rep_id IS NULL OR s.id IS NULL