SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM skills_dim s
INNER JOIN skills_job_dim sj ON s.skill_id = sj.skill_id
INNER JOIN job_postings_fact j ON sj.job_id = j.job_id
WHERE job_title_short = 'Data Scientist' 
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25