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


SELECT country_name, country_code
FROM forest_area
GROUP BY 1,2
ORDER BY 1 DESC



SELECT country_name, country_code
FROM forest_area
WHERE country_name = 'World'
ORDER BY 1 DESC


SELECT country_name, country_code
FROM land_area
WHERE country_name = 'World'
ORDER BY 1 DESC


SELECT country_name, country_code
FROM regions
WHERE country_name = 'World'
ORDER BY 1 DESC