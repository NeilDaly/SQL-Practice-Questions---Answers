/*
    Find the Count of the number of remote jobs postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill_id, name and count of postings requiring the skill
*/


WITH remote_jobs_skills AS
(
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS SkillList
    INNER JOIN
        job_postings_fact AS jobs
        ON jobs.job_id = SkillList.job_id
    WHERE
        jobs.job_work_from_home IS TRUE AND
        jobs.job_title_short = 'Data Analyst'
    GROUP BY
        SkillList.skill_id
)

SELECT 
    skills.skill_id,
    skills.skills AS skill_name,
    remote_jobs_skills.skill_count
FROM
    remote_jobs_skills
INNER JOIN
    skills_dim AS skills
    ON remote_jobs_skills.skill_id = skills.skill_id
ORDER BY
    skill_count DESC
LIMIT
    5