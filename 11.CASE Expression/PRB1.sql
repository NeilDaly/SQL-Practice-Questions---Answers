/* 
    From the job_postings_fact table,
     categorize the salaries from job postings that are data analyst jobs,
     that have yearly salary information. 
    Put salary into 3 different categories:

        If the salary_year_avg is greater than or equal to $100,000, then return ‘high salary’.
        If the salary_year_avg is greater than or equal to $60,000 but less than $100,000, then return ‘Standard salary.’
        If the salary_year_avg is below $60,000 return ‘Low salary’.
    Also, order from the highest to the lowest salaries.
*/

SELECT
    job_id,
    job_title,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 100000 THEN 'High Salary'
        WHEN salary_year_avg >= 60000 THEN 'Standard Salary'
        WHEN salary_year_avg < 60000 THEN 'Low Salary'
    END AS salary_category
FROM 
    job_postings_fact
WHERE
    salary_year_avg <> 0 AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC