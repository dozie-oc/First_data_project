SELECT
    s.skill_id,
    skills,
    COUNT(j.job_id) AS job_count,
    ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
FROM skills_dim s
INNER JOIN skills_job_dim sj ON s.skill_id = sj.skill_id
INNER JOIN job_postings_fact j ON sj.job_id = j.job_id
WHERE job_title_short = 'Data Scientist' 
GROUP BY s.skill_id
HAVING 
    COUNT(j.job_id) > 10
ORDER BY
    job_count DESC,
    avg_salary DESC
LIMIT 25