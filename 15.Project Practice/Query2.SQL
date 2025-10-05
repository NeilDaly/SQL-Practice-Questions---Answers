WITH Top_Skills AS
(
    SELECT
        jobs.job_id,
        jobs.job_title,
        jobs.salary_year_avg,
        companies.name AS Company_Name
    FROM
        job_postings_fact AS jobs
    LEFT JOIN
        company_dim AS companies
        ON companies.company_id = jobs.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        salary_year_avg <> 0 AND 
        job_location = 'Anywhere'
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    Top_Skills.*,
    skills.skills
FROM
    Top_Skills
INNER JOIN
    skills_job_dim AS SkillList
    ON SkillList.job_id = Top_Skills.job_id
INNER JOIN
    skills_dim AS skills
    ON skills.skill_id = SkillList.skill_id
ORDER BY
    Top_Skills.salary_year_avg DESC