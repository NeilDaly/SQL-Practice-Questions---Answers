/*
    Show the name and position of orchestra members who earn more than the average wage of all violinists.
*/

SELECT 
    name,
    position
FROM 
    members
WHERE
    wage > (SELECT AVG(wage) FROM members WHERE position = 'Violin')