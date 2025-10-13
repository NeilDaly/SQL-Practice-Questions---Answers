/*
    Find job postings from the first quarter that have a salary greater than $70k
    - Combine job posting tables from the first quarter of 2023 (Jan-Mar)
    - Gets job postings with an average salary > $70,000
*/

SELECT
    Q1_Postings.job_title_short,
    Q1_Postings.job_location,
    Q1_Postings.job_via,
    ROUND(Q1_Postings.salary_year_avg, 0),
    Q1_Postings.job_posted_date :: DATE
FROM
    (
        SELECT * FROM january_jobs
        UNION ALL
        SELECT * FROM february_jobs
        UNION ALL
        SELECT * FROM march_jobs
    ) AS Q1_Postings
WHERE
    Q1_Postings.salary_year_avg > 70000 AND
    Q1_Postings.job_title_short = 'Data Analyst'
ORDER BY
    Q1_Postings.salary_year_avg DESC