/*
    Show the names of orchestras that were created after the 'Chamber Orchestra' and have a rating greater than 7.5.
*/

SELECT 
    name
FROM
    orchestras
WHERE
    year > (SELECT year FROM orchestras WHERE name = 'Chamber Orchestra') AND
    rating > '7.5'
