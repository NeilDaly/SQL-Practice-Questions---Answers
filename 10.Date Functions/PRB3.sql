/* 
    Find companies (include company name) that have posted jobs offering health insurance, 
    where these postings were made in the second quarter of 2023. 
    Use date extraction to filter by quarter. 
    And order by the job postings count from highest to lowest.
*/

SELECT
    companies.name AS company_name,
    COUNT(jobs.job_id) AS posting_count
FROM
    company_dim AS companies
INNER JOIN
    job_postings_fact AS jobs
    ON companies.company_id = jobs.company_id
WHERE
    jobs.job_health_insurance IS TRUE AND
    EXTRACT(QUARTER FROM jobs.job_posted_date) = 2
GROUP BY
    companies.name
HAVING
    COUNT(jobs.job_id) >= 1
ORDER BY
    posting_count DESC