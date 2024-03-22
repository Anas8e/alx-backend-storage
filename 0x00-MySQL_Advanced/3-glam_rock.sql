SELECT band_name,
       IF(splits = 0, 2022 - formed_year, 2022 - formed_year) AS lifespan
FROM (
    SELECT band_name,
           YEAR(MAX(CASE WHEN attribute = 'formed' THEN CAST(value AS UNSIGNED) END)) AS formed_year,
           SUM(CASE WHEN attribute = 'split' THEN 1 ELSE 0 END) AS splits
    FROM bands
    WHERE style LIKE '%Glam rock%'
    GROUP BY band_name
) AS subquery
ORDER BY lifespan DESC;
