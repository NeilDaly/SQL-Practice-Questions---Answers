/* 
    Identify the top 5 skills that are most frequently mentioned in job postings. 
    Use a subquery to find the skill IDs with the highest counts in the skills_job_dim table and then join this result with the skills_dim table to get the skill names.
*/

SELECT 
    Skills.skills
FROM
    skills_dim AS Skills
INNER JOIN
    (
        SELECT
            skill_id,
            COUNT(job_id) AS skill_count
        FROM
            skills_job_dim AS SkillList
        GROUP BY
            SkillList.skill_id
        ORDER BY
            COUNT(job_id) DESC
        LIMIT 5
    ) AS Top_Skills
    ON Skills.skill_id = Top_Skills.skill_id
    ORDER BY
        Top_Skills.skill_count DESC



