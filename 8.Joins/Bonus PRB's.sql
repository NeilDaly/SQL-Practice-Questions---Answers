/*
    Find the Average Salary and number of job postings for each skill
*/

SELECT
    skills.skills AS skill_name,
    COUNT(SkillList.job_id) AS job_count,
    ROUND(AVG(jobs.salary_year_avg), 0) AS AVG_salary
FROM
    skills_dim AS Skills
LEFT JOIN
    skills_job_dim AS SkillList
    ON Skills.skill_id = SkillList.skill_id
LEFT JOIN
    job_postings_fact AS jobs
    ON SkillList.job_id = jobs.job_id
WHERE
    salary_year_avg <> 0
GROUP BY
    skills.skills
ORDER BY
    AVG_salary DESC