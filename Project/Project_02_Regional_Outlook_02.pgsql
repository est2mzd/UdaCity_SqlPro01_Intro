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
 T_1990_Total AS (
     SELECT 
          SUM(forest_area_sqkm) sum_forest,
          SUM(total_area_sqkm) sum_land,
          SUM(forest_area_sqkm) / SUM(total_area_sqkm)  *100 forest_ratio
     FROM forestation
     WHERE year = 1990),     
 T_1990_Each AS (
     SELECT region,
          SUM(forest_area_sqkm) sum_forest,
          SUM(total_area_sqkm) sum_land,
          SUM(forest_area_sqkm) / SUM(total_area_sqkm)  *100 forest_ratio
     FROM forestation
     WHERE year = 1990
     GROUP BY 1
     ORDER BY 4 DESC),   
 T_1990_Max AS (
     SELECT region, forest_ratio
     FROM T_1990_Each
     WHERE forest_ratio = (SELECT MAX(forest_ratio) FROM T_1990_Each) ),
 T_1990_Min AS (
     SELECT region, forest_ratio
     FROM T_1990_Each
     WHERE forest_ratio = (SELECT MIN(forest_ratio) FROM T_1990_Each) )

SELECT T_1990_Total.forest_ratio forest_ratio_total,
       T_1990_Max.region   region_max,
       T_1990_Max.forest_ratio   forest_ratio_max,
       T_1990_Min.region   region_min,
       T_1990_Min.forest_ratio   forest_ratio_min
FROM T_1990_Total, T_1990_Max, T_1990_Min

