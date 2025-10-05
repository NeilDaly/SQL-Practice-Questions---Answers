/* 
    Explore job postings by listing
     job id, 
     job titles, 
     company names,
     average salary rates, 
     while categorizing these salaries relative to the average in their respective countries. 
    Include the month of the job posted date. 
    Use CTEs, conditional logic, and date functions, to compare individual salaries with national averages.
*/

WITH avg_salary_country AS
(
    SELECT
        job_country AS country,
        AVG(salary_year_avg) AS average_salary
    FROM
        job_postings_fact
    GROUP BY
        country
)

SELECT
    jobs.job_id,
    jobs.job_title,
    companies.name AS company_name,
    jobs.salary_year_avg AS salary_rate,
    CASE
        WHEN jobs.salary_year_avg > avg_salary_country.average_salary 
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS salary_classification,
    EXTRACT(MONTH FROM jobs.job_posted_date) AS posted_month
FROM
    job_postings_fact AS jobs
INNER JOIN
    company_dim AS companies
    ON jobs.company_id = companies.company_id
INNER JOIN
    avg_salary_country
    ON jobs.job_country = avg_salary_country.country
ORDER BY
    posted_month DESC