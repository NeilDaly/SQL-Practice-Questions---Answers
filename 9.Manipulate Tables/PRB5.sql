/* 
    Modify the remote column so that it defaults to FALSE in the data_science_job table.
    Insert this new row after modifying the remote column:
*/

ALTER TABLE data_science_jobs
ALTER COLUMN remote SET DEFAULT FALSE;

-- Inserts a new row in with the following information
INSERT INTO data_science_jobs (job_title, company_name, posted_on)
VALUES
    ('Data Scientist', 'Google', 'February 5, 2023');

SELECT * FROM 
data_science_jobs