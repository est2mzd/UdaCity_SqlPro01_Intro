https://knowledge.udacity.com/questions/177394


WITH tableA
     AS (SELECT country_name, forest_area_sqkm - 1324449 AS area_lost
         FROM   forest_area
         WHERE  forest_area_sqkm > 1324449 AND forest_area.year=2016 
         ORDER  BY area_lost ASC, forest_area_sqkm ASC
         ),
     tableB AS (SELECT country_name, 1324449 - forest_area_sqkm AS area_lost
         FROM   forest_area
         WHERE  forest_area_sqkm <= 1324449 AND forest_area.year=2016
         ORDER  BY forest_area_sqkm DESC
         ),
     forest_area_lost AS (SELECT *
         FROM   tableA
         UNION ALL
         SELECT *
         FROM   tableB)
SELECT  *
FROM   forest_area_lost
ORDER  BY area_lost ASC