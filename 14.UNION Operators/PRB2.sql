/* 
    Retrieve the:
     job id,
     job title short, 
     job location, 
     job via, 
     skill and skill type
    For each job posting from the first quarter (January to March). 
    
    Using a subquery to
     combine job postings from the first quarter
     Only include postings with an average yearly salary greater than $70,000.
*/

SELECT
    Q1.job_id,
    Q1.job_title_short,
    Q1.job_location,
    Q1.job_via,
    q1.salary_year_avg,
    skills.skills AS Skill_Name,
    skills.type
FROM
    (
        SELECT * FROM january_jobs
        UNION ALL
        SELECT * FROM february_jobs
        UNION ALL
        SELECT * FROM march_jobs
    )
    AS Q1
LEFT JOIN
    skills_job_dim AS SkillList
    ON SkillList.job_id = Q1.job_id
LEFT JOIN
    skills_dim AS skills
    ON skills.skill_id = SkillList.skill_id
WHERE
    Q1.salary_year_avg > 70000
ORDER BY
    Q1.job_id