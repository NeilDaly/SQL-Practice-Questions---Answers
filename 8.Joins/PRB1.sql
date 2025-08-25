/* 
    Retrieve a list of job titles
     (job_title from the job_posting_fact table) 
     with their corresponding company names (name from the company_dim table). 
     Also, get the
      job_id, 
      job_location, 
      job_posted_date. 
    Only return job postings that have the ‘Data Scientist' as the job title (job_title_short). 
    Order by the job posted date in descending order.
*/

SELECT
    job_id,
    job_title,
    Companies.name,
    job_location,
    job_posted_date
FROM
    job_postings_fact AS Jobs
INNER JOIN
    company_dim AS Companies
    ON Jobs.company_id = Companies.company_id
WHERE
    job_title_short = 'Data Scientist'
ORDER BY
    job_posted_date DESC