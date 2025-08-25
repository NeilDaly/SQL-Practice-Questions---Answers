/* 
    Using the job_postings_fact table,
     find the average, minimum, and maximum salary range for each job_title_short. 
     Only include job titles with more than 1,000 job postings and group data by job_title_short.
    Order by job_title_short in ascending order.
*/

SELECT
    job_title_short AS Job_Title,
    AVG(salary_year_avg) AS Average_Yearly_Salary,
    MIN(salary_year_avg) AS Minimum_Yearly_Salary,
    MAX(salary_year_avg) AS Maximum_Yearly_Salary
FROM
    job_postings_fact
GROUP BY
    job_title_short
HAVING
    COUNT(job_id) > 1000
ORDER BY
    job_title_short