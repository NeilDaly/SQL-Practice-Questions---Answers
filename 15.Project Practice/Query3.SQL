SELECT
    skills.skills,
    COUNT(Jobs.job_id) AS skill_demand
FROM
    job_postings_fact AS jobs
INNER JOIN
    skills_job_dim AS SkillList
    ON SkillList.job_id = jobs.job_id
INNER JOIN
    skills_dim AS Skills
    ON skills.skill_id = SkillList.skill_id
WHERE
    jobs.job_title_short = 'Data Analyst' AND
    Jobs.job_work_from_home = TRUE
GROUP BY
    skills.skills
ORDER BY
    skill_demand DESC
LIMIT 5