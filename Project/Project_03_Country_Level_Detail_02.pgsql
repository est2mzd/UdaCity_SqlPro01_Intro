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

WITH    
 T_ALL_Year AS (
     SELECT year,
            country_name,
          SUM(forest_area_sqkm) sum_forest,
          SUM(total_area_sqkm)  sum_land,
          SUM(forest_area_sqkm) / SUM(total_area_sqkm)  *100 forest_ratio
     FROM forestation
     WHERE country_name != 'World' 
     GROUP BY 1,2
     ORDER BY 4 DESC),
 T_1990 AS (
     SELECT country_name, sum_forest, sum_land, forest_ratio
     FROM T_ALL_Year
     WHERE year = 1990
     ORDER BY 1 DESC), 
 T_2016 AS (
     SELECT country_name, sum_forest, sum_land, forest_ratio
     FROM T_ALL_Year
     WHERE year = 2016
     ORDER BY 1 DESC),
 T_DIFF AS (
     SELECT T_1990.country_name country_name,
            T_2016.forest_ratio - T_1990.forest_ratio forest_ratio_diff,
            T_1990.forest_ratio forest_ratio_1990,
            T_2016.forest_ratio forest_ratio_2016
     FROM T_1990
     JOIN T_2016 ON T_1990.country_name = T_2016.country_name
     ORDER BY 2 DESC)      

SELECT *
FROM T_DIFF
WHERE forest_ratio_diff IS NOT null
ORDER BY forest_ratio_diff DESC

