SELECT
    skills.skills,
    ROUND(AVG(salary_year_avg), 0) AS AVG_Salary
FROM
    job_postings_fact AS jobs
INNER JOIN
    skills_job_dim AS SkillList
    ON jobs.job_id = SkillList.job_id
INNER JOIN
    skills_dim AS Skills
    ON Skills.skill_id = SkillList.skill_id
WHERE
    jobs.job_title_short = 'Data Analyst' AND
    jobs.job_work_from_home = TRUE AND
    jobs.salary_year_avg <> 0
GROUP BY
    skills.skills
ORDER BY
    AVG_Salary DESC
LIMIT
    25