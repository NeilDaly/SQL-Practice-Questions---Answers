/* 
    Count the number of unique companies that
     offer work from home (WFH) versus 
     those requiring work to be on-site. 
    Use the job_postings_fact table to count and compare the distinct companies based on their WFH policy (job_work_from_home).
*/

SELECT 
    COUNT(DISTINCT company_id),
    CASE
        WHEN job_work_from_home = TRUE THEN 'WFH_YES'
        WHEN job_work_from_home = FALSE THEN 'WFH_NO'
    END AS WFH_Status
FROM
    job_postings_fact
GROUP BY
    WFH_Status