/*
    Select the names of all orchestras that have the same city of origin as any city in which any orchestra performed in 2013.
*/

SELECT 
    name
FROM
    orchestras
WHERE
    city_origin IN (SELECT city FROM concerts WHERE year = 2003)