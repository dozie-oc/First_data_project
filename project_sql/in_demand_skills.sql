/*This is to assess the 5 most demanded skills based on the jobs provided 
in this dataset*/

WITH top_skills AS (
    SELECT
        s.skill_id,
        skills,
        COUNT(*) AS skill_count
    FROM skills_dim s
    INNER JOIN skills_job_dim sj ON s.skill_id = sj.skill_id
    INNER JOIN job_postings_fact j ON sj.job_id = j.job_id
    WHERE job_title_short = 'Data Scientist'
    GROUP BY 
        s.skill_id,
        skills
)

SELECT 
    skills,
    skill_count
FROM top_skills
ORDER BY
    skill_count DESC
LIMIT 5
