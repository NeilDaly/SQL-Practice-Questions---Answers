/* 
    Find companies (include company name) that have posted jobs offering health insurance, 
    where these postings were made in the second quarter of 2023. 
    Use date extraction to filter by quarter. 
    And order by the job postings count from highest to lowest.
*/

SELECT 
    Companies.name,
    COUNT(Jobs.job_id) AS job_postings
FROM
    job_postings_fact AS Jobs
INNER JOIN
    company_dim AS Companies
    ON Companies.company_id = Jobs.company_id
WHERE
    Jobs.job_health_insurance IS TRUE AND
    EXTRACT(QUARTER FROM job_posted_date) = 2
GROUP BY
    Companies.name
HAVING
    COUNT(Jobs.job_id) > 0
ORDER BY
    job_postings DESC