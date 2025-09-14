/*
    Select the
     names and positions (i.e. instrument played) of all orchestra members that have
      above 10 years of experience and do not belong to orchestras with a rating below 8.0.
*/

SELECT 
    name,
    position
FROM
    members
WHERE
    experience > 5 AND orchestra_id NOT IN (SELECT id FROM orchestras WHERE rating < '3.5')
