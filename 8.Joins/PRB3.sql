/* 
    Identify the most in-demand skills for jobs that offer
     remote work,
     have an average yearly salary above $100,000. 
    Focus on counting how many job postings mention each skill, so you can determine which skills are most valuable in the high-paying remote job market. 
    Return the
     skill name (skills), 
     number of job postings that mention each skill, 
     ordered by the number of job postings in descending order.
*/

SELECT
    Skills.skills AS Skill_Name,
    COUNT(Jobs.job_id) AS Job_Posting_Count
FROM
    skills_dim AS Skills
INNER JOIN
    skills_job_dim AS SkillList
    ON Skills.skill_id = SkillList.skill_id
INNER JOIN
    job_postings_fact AS Jobs
    ON Jobs.job_id = SkillList.job_id
WHERE
    job_work_from_home = TRUE AND
    salary_year_avg > 100000
GROUP BY
    Skill_Name
ORDER BY
    Job_Posting_Count DESC
