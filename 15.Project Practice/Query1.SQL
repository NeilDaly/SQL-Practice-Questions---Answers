SELECT
    jobs.job_id,
    jobs.job_title,
    jobs.job_location,
    jobs.job_schedule_type,
    jobs.salary_year_avg,
    jobs.job_posted_date,
    companies.name AS Company_Name
FROM
    job_postings_fact AS jobs
LEFT JOIN
    company_dim AS companies
    ON companies.company_id = jobs.company_id
WHERE
     job_title_short = 'Data Analyst' AND 
     salary_year_avg <> 0 AND 
     job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10