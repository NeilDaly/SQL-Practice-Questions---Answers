/* 
    Your goal is to calculate two metrics for each company:
        1. The number of unique skills required for their job postings.
        2. The highest average annual salary among job postings that require at least one skill.
    Your final query should return the company name, the count of unique skills, and the highest salary. 
    For companies with no skill-related job postings, the skill count should be 0 and the salary should be null.
*/

WITH required_skills AS
(
    SELECT
        companies.company_id,
        COUNT(DISTINCT SkillList.skill_id) AS unique_skills
    FROM
        company_dim AS companies
    LEFT JOIN
        job_postings_fact AS jobs
        ON jobs.company_id = companies.company_id
    LEFT JOIN
        skills_job_dim AS SkillList
        ON SkillList.job_id = jobs.job_id
    GROUP BY
        companies.company_id
),

max_salary AS
 (
    SELECT
        jobs.company_id,
        MAX(jobs.salary_year_avg) AS Maximum_Salary
    FROM
        job_postings_fact AS jobs
    WHERE
        jobs.job_id IN (SELECT job_id FROM skills_job_dim)
    GROUP BY
        jobs.company_id
 )

 SELECT
    companies.name,
    required_skills.unique_skills,
    max_salary.Maximum_Salary
FROM
    company_dim AS companies
LEFT JOIN
    required_skills ON required_skills.company_id = companies.company_id
LEFT JOIN
    max_salary ON max_salary.company_id = companies.company_id
ORDER BY
    companies.name