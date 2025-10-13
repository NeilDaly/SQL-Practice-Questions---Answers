SELECT *
FROM
    job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date) = 1
LIMIT
    10