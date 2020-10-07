SELECT f.country_code country_code,
          f.country_name country_name,
          f.year AS year,
          f.forest_area_sqkm forest_area_sqkm,
          l.total_area_sq_mi total_area_sq_mi,
          r.region region,
          r.income_group income_group,
          (f.forest_area_sqkm/l.total_area_sq_mi/2.59)*100 forest_area_percent
FROM forest_area f
JOIN land_area l
     ON f.country_code = l.country_code
     AND f.year = l.year
JOIN regions r
     ON r.country_code = l.country_code


SELECT r.country_code r_code, l.country_code l_code
FROM regions r
JOIN land_area l ON r.country_code = l.country_code

SELECT *
FROM regions

SELECT *
FROM forest_area
