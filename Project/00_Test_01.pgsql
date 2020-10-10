DROP VIEW IF EXISTS forestation;

CREATE VIEW forestation AS
     (
     SELECT f.country_code country_code,
            f.country_name country_name,
            f.year AS year,
            f.forest_area_sqkm forest_area_sqkm,
            l.total_area_sq_mi*2.59 total_area_sqkm,
            r.region region,
            r.income_group income_group,
            (f.forest_area_sqkm/l.total_area_sq_mi/2.59)*100 forest_area_percent
     FROM forest_area f
     JOIN land_area l
          ON f.country_code = l.country_code
          AND f.year = l.year
     JOIN regions r
          ON r.country_code = f.country_code
     );

SELECT *
FROM forestation
WHERE country_name = 'World'
ORDER BY year

with T1 as(
SELECT SUM(forest_area_sqkm) each_sum
FROM forest_area
GROUP BY country_name
HAVING country_name != 'World'
)

SELECT SUM(each_sum)
FROM T1

1093577969
1084580784

SELECT *
FROM regions