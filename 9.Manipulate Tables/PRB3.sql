/* 
    Alter the data_science_jobs table to add a new boolean column (uses True or False values) named remote.
*/

ALTER TABLE data_science_jobs
ADD COLUMN remote BOOLEAN;

SELECT * FROM 
data_science_jobs