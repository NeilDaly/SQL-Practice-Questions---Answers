/*
    PRB1: 
        Find the job title that has the highest average yearly salary.
*/

SELECT
    job_title_short,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    salary_year_avg = 
    (SELECT MAX(salary_year_avg) FROM job_postings_fact)


/*
    PRB2:
        Show all companies where the average salary is above the overall average salary.
*/

SELECT
    C.name,
    AVG(J.salary_year_avg) AS avg_salary
FROM
    job_postings_fact J
INNER JOIN
    company_dim C
    ON J.company_id = C.company_id
GROUP BY
    C.name
HAVING
    AVG(J.salary_year_avg) > (SELECT AVG(salary_year_avg) FROM job_postings_fact)

/*
    PRB3:
        Which skill appears in the job posting with the earliest posted date?
*/

SELECT DISTINCT
    s.skills
FROM
    skills_dim s
INNER JOIN
    skills_job_dim sjd
    ON s.skill_id = sjd.skill_id
INNER JOIN
    job_postings_fact J
    ON J.job_id = sjd.job_id
WHERE
    j.job_posted_date = (SELECT MIN(job_posted_date) FROM job_postings_fact)

/*
    PRB4:
        List the job postings that mention skills in the “Programming Language” type from skills_dim.
*/

SELECT
    job_id,
    job_title
FROM
    job_postings_fact
WHERE
    job_id IN (SELECT SJD.job_id FROM skills_job_dim SJD INNER JOIN skills_dim SD ON SD.skill_id = SJD.skill_id WHERE SD.type LIKE '%Programming Language%')

/*
    PRB5:
        Get the names of companies that posted jobs requiring at least one skill also required by Google (assuming “Google” exists in company_dim).
*/

SELECT DISTINCT
    c.name
FROM
    company_dim c
INNER JOIN
    job_postings_fact j
    ON j.company_id = c.company_id
WHERE
    job_id IN (SELECT sjd.job_id FROM skills_job_dim sjd WHERE skill_id IN
        (SELECT sjd2.skill_id FROM skills_job_dim sjd2
        INNER JOIN job_postings_fact j2 ON j2.job_id = sjd2.job_id
        INNER JOIN company_dim c2 ON c2.company_id = j2.company_id
        WHERE c2.name = 'Google'))

/*
    PRB6:
        Find all job postings where the job_id is in the top 10 highest salaries.
*/

SELECT
    job_id,
    job_title,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_id IN (SELECT job_id FROM job_postings_fact ORDER BY salary_year_avg DESC LIMIT 10)


/*
    PRB7:
        For each job posting, show its title and salary only if the salary is greater than the average salary of jobs in the same country.
*/

SELECT
    j.job_id,
    j.job_title,
    j.job_country,
    j.salary_year_avg
FROM 
    job_postings_fact j
WHERE
    j.salary_year_avg > (SELECT AVG(salary_year_avg) FROM job_postings_fact j2 WHERE j.job_country = j2.job_country)

/*
    PRB8:
        List companies that have posted jobs more than the average number of postings across all companies
*/

SELECT
    c.name,
    COUNT(j.job_id) AS Job_Count
FROM
    company_dim c
INNER JOIN
    job_postings_fact j
    ON c.company_id = j.company_id
GROUP BY
    c.name
HAVING
    COUNT(j.company_id) > (SELECT AVG(j.Job_Count) FROM (SELECT COUNT(job_id) FROM job_postings_fact))

/*
    PRB9:
        For each skill, show how many jobs require it only if it’s the most requested skill for that type.
*/

SELECT sd.skills, sd.type, COUNT(sjd.job_id) AS Job_Count
FROM skills_dim SD
INNER JOIN skills_job_dim sjd ON sjd.skill_id = sd.skill_id
GROUP BY sd.skill_id, sd.skills, sd.type
HAVING COUNT(sjd.job_id) = (
    SELECT MAX(CNT) 
    FROM (
        SELECT COUNT(sjd2.job_id) AS CNT 
        FROM skills_dim sd2
        INNER JOIN skills_job_dim sjd2 ON sd2.skill_id = sjd2.skill_id 
        WHERE sd2.type = sd.type 
        GROUP BY sd2.skill_id
        ) sub
    )







/*
    PRB : 
*/


SELECT
FROM ;


SELECT * FROM job_postings_fact LIMIT 5;
SELECT * FROM company_dim LIMIT 5;
SELECT * FROM skills_dim LIMIT 5;
SELECT * FROM skills_job_dim  LIMIT 5;
