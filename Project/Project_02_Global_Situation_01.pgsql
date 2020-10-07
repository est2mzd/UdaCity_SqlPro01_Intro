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
 T_ALL AS (
     SELECT year,
          SUM(forest_area_sqkm) sum_forest,
          SUM(total_area_sqkm) sum_land,
          SUM(forest_area_sqkm) / SUM(total_area_sqkm)  *100 forest_ratio
     FROM forestation
     WHERE country_name != 'World'
     GROUP BY year),
 T_1990 AS (
     SELECT sum_forest, sum_land
     FROM T_ALL
     WHERE year = 1990),
 T_2016 AS (
     SELECT sum_forest, sum_land
     FROM T_ALL
     WHERE year = 2016),
 T_Calc_1 AS (
      SELECT T_1990.sum_forest - T_2016.sum_forest AS forest_loss,
            (T_1990.sum_forest - T_2016.sum_forest)/T_1990.sum_forest*100 AS forest_loss_ratio
      FROM T_1990, T_2016),
 T_Land_2016 AS (
      SELECT country_name, SUM(total_area_sqkm) sum_land
      FROM forestation
      WHERE year = 2016
      GROUP BY country_name
      ORDER BY sum_land),
 T_Calc_2 AS (
      SELECT country_name, sum_land
      FROM T_Calc_1, T_Land_2016
      WHERE T_Calc_1.forest_loss >  T_Land_2016.sum_land
      ORDER BY sum_land DESC
      LIMIT 1)

SELECT T_1990.sum_forest forest_1990, 
       T_2016.sum_forest forest_2016,
       forest_loss,
       forest_loss_ratio,
       T_Calc_2.country_name,
       T_Calc_2.sum_land
FROM T_1990, T_2016, T_Calc_1, T_Calc_2
