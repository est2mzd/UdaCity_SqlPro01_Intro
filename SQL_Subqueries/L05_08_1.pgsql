SELECT CONCAT(s.id, '_', r.name) as EMP_ID_REGION, s.name
FROM sales_reps s
JOIN region r ON r.id = s.region_id