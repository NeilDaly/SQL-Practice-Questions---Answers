/* 
    Fetch all job postings, including their:
     job_id, 
     job_title, 
     job_location,
     names of the skills required (skills); even if no skills are listed for a job.

    Ensure that the job has a location that includes the words 'New York' and also offers health insurance.
    Use the job_postings_fact, skills_job_dim, and skills_dim tables.
    Order by job_id in descending order.
*/

SELECT
    Jobs.job_id,
    Jobs.job_title,
    Jobs.job_location,
    Jobs.job_health_insurance,
    Skills.skills AS Skill_Name
FROM
    job_postings_fact AS Jobs
LEFT JOIN
    skills_job_dim AS SkillList
    ON Jobs.job_id = SkillList.job_id
LEFT JOIN
    skills_dim AS Skills
    ON Skills.skill_id = SkillList.skill_id
WHERE
    job_location LIKE '%New York%' AND
    job_health_insurance = TRUE
ORDER BY
    Jobs.job_id DESC
