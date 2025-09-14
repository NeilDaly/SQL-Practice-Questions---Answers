/* 
    Insert three job postings into the data_science_jobs table. Make sure each job posting has a unique job_id, a job_title, a company_name, and a post_date.
*/

INSERT INTO data_science_jobs (job_title, company_name, post_date)
VALUES
    ('Data Scientist', 'Tech Innovations', 'January 1, 2023'),
    ('Machine Learning Engineer', 'Data Driven CO', 'January 15, 2023'),
    ('AI Specialist', 'Future Tech', 'February 1, 2023');

SELECT * FROM 
data_science_jobs