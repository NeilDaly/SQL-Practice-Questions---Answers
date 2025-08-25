/* 
    Identify all job postings that
     have neither an annual average salary (salary_year_avg) 
     nor an average hourly wage (salary_hour_avg) in the job_postings_fact table. 
    Return the job_id, job_title, salary_year_avg, salary_hour_avg. 
    This can be useful to look at postings where there’s no compensation. Order by job_id in ascending order.
*/

SELECT
    job_id,
    job_title,
    salary_year_avg AS annual_average_salary,
    salary_hour_avg AS average_hourly_wage
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NULL AND
    salary_hour_avg IS NULL
ORDER BY
    job_id