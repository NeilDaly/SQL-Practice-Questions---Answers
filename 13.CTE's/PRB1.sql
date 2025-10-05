/* 
    Identify companies with:
     the most diverse (unique) job titles. 
    Use a CTE to:
     count the number of unique job titles per company,
     select companies with the highest diversity in job titles
*/

WITH diverse_jobs AS
(
    SELECT
        company_id,
        COUNT(DISTINCT job_title) AS unique_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    companies.name,
    UJ.unique_jobs
FROM
    company_dim AS companies
INNER JOIN
    diverse_jobs AS UJ
        ON UJ.company_id = companies.company_id
ORDER BY
    UJ.unique_jobs DESC
LIMIT
    10
