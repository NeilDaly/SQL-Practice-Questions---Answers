/* 
    Determine the size category ('Small', 'Medium', or 'Large') for each company by first
     identifying the number of job postings they have. 
    Use a subquery to
     calculate the total job postings per company. 
    A company is considered
     'Small' if it has less than 10 job postings, 
     'Medium' if the number of job postings is between 10 and 50,
     'Large' if it has more than 50 job postings. 
    Implement a subquery to aggregate job counts per company before classifying them based on size.
*/

SELECT
    company_id,
    name,
    CASE
        WHEN Job_Posting_Count < 10 THEN 'Small'
        WHEN Job_Posting_Count BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS Company_Size
FROM
    (
        SELECT
            Companies.company_id,
            Companies.name,
            COUNT(Jobs.job_id) AS Job_Posting_Count
        FROM
            company_dim AS Companies
        INNER JOIN
            job_postings_fact AS Jobs
            ON Jobs.company_id = Companies.company_id
        GROUP BY
            Companies.company_id,
            Companies.name
    ) AS Job_Counts