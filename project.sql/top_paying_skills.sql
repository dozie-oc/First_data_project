/*Now this query is meant to show the skills reqired for the 
previously queried highest paying data scientist jobs, allowing
one see what skills are needed for the highes paying remote jobs
available.*/

WITH top_paying_jobs AS (
    SELECT
        j.job_id,
        j.job_title,
        c.name AS company_name,
        j.salary_year_avg
    FROM job_postings_fact j
    LEFT JOIN company_dim c ON j.company_id = c.company_id
    WHERE job_title_short = 'Data Scientist' AND 
        salary_year_avg IS NOT NULL AND 
        job_location = 'Anywhere' 
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    tpj.*,
    STRING_AGG(skills,',' ORDER BY skills) AS required_skills
FROM top_paying_jobs tpj
INNER JOIN skills_job_dim sj ON sj.job_id = tpj.job_id
INNER JOIN skills_dim s ON s.skill_id = sj.skill_id
GROUP BY
    tpj.job_id,
    tpj.job_title,
    tpj.company_name,
    tpj.salary_year_avg
ORDER BY 
    tpj.salary_year_avg DESC