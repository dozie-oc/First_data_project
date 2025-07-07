/*This query is designed to filter out the 10 highest paying 
remote Data Scientist jobs from the dataset.*/

SELECT
    j.job_id,
    j.job_title,
    c.name AS company_name,
    j.job_location,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date
FROM job_postings_fact j
LEFT JOIN company_dim c ON j.company_id = c.company_id
WHERE job_title_short = 'Data Scientist' AND 
      salary_year_avg IS NOT NULL AND 
      job_location = 'Anywhere' 
ORDER BY salary_year_avg DESC
LIMIT 10