/*
    Look for Non-Senior Data Analyst or Business Analyst Roles
    Get the Job Title, Location, and average yearly Salary
*/

SELECT
    job_title,
    job_location AS location,
    salary_year_avg AS AVG_Salary
FROM
    job_postings_fact
WHERE
    (job_title LIKE '%Data%' OR job_title LIKE '%Business%') AND
    job_title LIKE '%Analyst%' AND
    job_title NOT LIKE '%Senior%'