/*
    Show the name and number of members for each orchestra that has more members than the average membership of all orchestras in the table.
*/

SELECT
    orchestra.name,
    COUNT(Member.id)
FROM 
    orchestras AS orchestra
LEFT JOIN
    members AS Member ON Member.orchestra_id = orchestra.id
GROUP BY
    orchestra.name
WHERE number_of_members > (SELECT AVG(id) from members)

SELECT * FROM 
concerts;
SELECT * FROM 
orchestras;
SELECT * FROM 
members;