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
     WHERE year = 1990 AND region != 'World'
     ),         
 T_2106_Total AS (
     SELECT 
          SUM(forest_area_sqkm) sum_forest,
          SUM(total_area_sqkm) sum_land,
          SUM(forest_area_sqkm) / SUM(total_area_sqkm)  *100 forest_ratio
     FROM forestation
     WHERE year = 2016 AND region != 'World'
     )

SELECT T_1990_Total.forest_ratio forest_ratio_total_1990, 
       T_2106_Total.forest_ratio forest_ratio_total_2016
FROM T_1990_Total, T_2106_Total

