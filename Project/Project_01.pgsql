DROP VIEW forestation;

CREATE VIEW forestation AS
     (
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
          ON r.country_code = f.country_code
     );


SELECT *
FROM forestation;



DROP VIEW forestation;

CREATE VIEW forestation AS
     (SELECT
     f.country_code,
     f.country_name,
     f.year,
     f.forest_area_sqkm,
     l.total_area_sq_mi,
     r.region,
     r.income_group, 
     (f.forest_area_sqkm*100)/(l.total_area_sq_mi*2.59) as forest_area_percent_in_sqkm
     FROM forest_area f
     JOIN land_area l
     ON f.country_code = l.country_code
     AND f.year = l.year
     JOIN regions r
     ON f.country_code = r.country_code);

SELECT *
FROM forestation;
