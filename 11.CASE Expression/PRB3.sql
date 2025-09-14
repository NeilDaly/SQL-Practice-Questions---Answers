/* 
    Write a SQL query using the job_postings_fact table that returns the following columns:
        job_id
        salary_year_avg
        experience_level (derived using a CASE WHEN)
        remote_option (derived using a CASE WHEN)
    Only include rows where salary_year_avg is not null.

    -- Additional Instructions
     
        1. Experience Level
            Create a new column called experience_level based on keywords in the job_title column:
                - Contains "Senior" → 'Senior'
                - Contains "Manager" or "Lead" → 'Lead/Manager'
                - Contains "Junior" or "Entry" → 'Junior/Entry'
                - Otherwise → 'Not Specified'
            Use ILIKE instead of LIKE to perform case-insensitive matching (PostgreSQL-specific).

        2. Remote Option
            Create a new column called remote_option:
                - If job_work_from_home is true → 'Yes'
                - Otherwise → 'No'

        3. Filter and Order
                - Filter out rows where salary_year_avg is NULL
                - Order the results by job_id
*/

SELECT 
    job_id,
    salary_year_avg,
    CASE
        WHEN job_title ILIKE '%Senior%' THEN 'Senior'
        WHEN job_title ILIKE '%Manager%' OR job_title ILIKE '%Lead%' THEN 'Lead/Manager'
        WHEN job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry'
        ELSE 'Not Specified'
    END AS experience_level,
    CASE
        WHEN job_work_from_home IS TRUE THEN 'Yes'
        ELSE 'No'
    END AS remote_option
FROM
    job_postings_fact
WHERE
    salary_year_avg <> 0
ORDER BY
    job_id