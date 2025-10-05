/* 
    Analyze the monthly demand for skills by
     counting the number of job postings for each skill in the first quarter (January to March),
     utilizing data from separate tables for each month. 
    Ensure to include skills from all job postings across these months
*/

-- CTE to get the Data
WITH Q1Data AS
(
    SELECT job_id, job_posted_date FROM january_jobs
    UNION ALL
    SELECT job_id, job_posted_date FROM february_jobs
    UNION ALL
    SELECT job_id, job_posted_date FROM march_jobs
),

-- CTE for calculating monthly skill demand based on the combined postings
monthlyDemand AS
(
    SELECT
        Skills.skills,
        EXTRACT(YEAR FROM Q1.job_posted_date) AS Year,
        EXTRACT(MONTH FROM Q1.job_posted_date) AS Month,
        COUNT(Q1.job_id) AS job_count
    FROM
        Q1Data AS Q1
    INNER JOIN
        skills_job_dim AS SkillList
        ON SkillList.job_id = Q1.job_id
    INNER JOIN
        skills_dim AS Skills
        ON Skills.skill_id = SkillList.skill_id
    GROUP BY
        Skills.skills,
        Year,
        Month
)

-- Main query to display the demand for each skill during the first quarter
SELECT
    skills,
    Year,
    Month,
    job_count
FROM
    monthlyDemand
ORDER BY
    skills,
    job_count DESC