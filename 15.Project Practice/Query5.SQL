WITH Top_Skills AS
(
    SELECT
        skills.skill_id,
        skills.skills,
        COUNT(jobs.job_id) AS demand_count
    FROM
        job_postings_fact AS jobs
    INNER JOIN
        skills_job_dim AS SkillList
        ON SkillList.job_id = jobs.job_id
    INNER JOIN
        skills_dim AS Skills
        ON Skills.skill_id = SkillList.skill_id
    WHERE
        jobs.job_title_short = 'Data Analyst' AND
        jobs.salary_year_avg <> 0 AND
        jobs.job_work_from_home = TRUE
    GROUP BY
        skills.skill_id
),
Top_Paying_Skills AS
(
    SELECT
        skills.skill_id,
        skills.skills,
        ROUND(AVG(salary_year_avg), 0) AS AVG_Salary
    FROM
        job_postings_fact AS jobs
    INNER JOIN
        skills_job_dim AS SkillList
        ON SkillList.job_id = jobs.job_id
    INNER JOIN
        skills_dim AS Skills
        ON Skills.skill_id = SkillList.skill_id
    WHERE
        jobs.job_title_short = 'Data Analyst' AND
        jobs.salary_year_avg <> 0 AND
        jobs.job_work_from_home = TRUE
    GROUP BY
        skills.skill_id
)

SELECT
    Top_Skills.skill_id,
    Top_Skills.skills,
    Top_Skills.demand_count,
    Top_Paying_Skills.AVG_Salary
FROM
    Top_Skills
INNER JOIN
    Top_Paying_Skills
    ON Top_Paying_Skills.skill_id = Top_Skills.skill_id
WHERE
    Top_Skills.demand_count > 10
ORDER BY
    Top_Paying_Skills.AVG_Salary DESC,
    Top_Skills.demand_count DESC
LIMIT
    25


-- The below returns the same Data
-- This Query is written without CTE's but gets the same Results
SELECT
    skills.skill_id,
    skills.skills,
    COUNT(SkillList.job_id) AS demand_count,
    ROUND(AVG(jobs.salary_year_avg), 0) AS AVG_Salary
FROM
    job_postings_fact AS jobs
INNER JOIN
    skills_job_dim AS SkillList
    ON SkillList.job_id = jobs.job_id
INNER JOIN
    skills_dim AS skills
    ON skills.skill_id = SkillList.skill_id
WHERE
    jobs.job_title_short = 'Data Analyst' AND
    jobs.salary_year_avg <> 0 AND
    jobs.job_work_from_home = TRUE
GROUP BY
    skills.skill_id
HAVING
    COUNT(SkillList.job_id) > 10
ORDER BY
    AVG_Salary DESC,
    demand_count DESC
LIMIT
    25