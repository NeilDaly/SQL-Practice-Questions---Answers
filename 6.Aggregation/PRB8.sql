/* 
    In the job_postings_fact table
     count the number of job postings for each location (job_location) that do NOT offer remote work. 
     Display the location and the count of non-remote job postings, and order the results by the count in descending order. 
    Show locations where the average salary for non-remote jobs is above $70,000.
*/

SELECT
    job_location,
    COUNT(job_id) AS Non_Remote_Job_Postings
FROM
    job_postings_fact
WHERE
    job_work_from_home = FALSE
GROUP BY
    job_location
HAVING
    AVG(salary_year_avg) > 70000
ORDER BY
    Non_Remote_Job_Postings DESC
