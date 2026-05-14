/*Question:
-What are the top 10 in-demand skills for data engineers?
-What are the top 10 in-demand skills for data analysts? 
-Focus on remote job postings only
Why: Retrieves the top 10 skills with the highest demand in the remote job sector. Providing insights to both data engineering and data anylyst roles.*/

SELECT 
    sd.skills, 
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id 
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
GROUP BY
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;

/*
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
*/

SELECT 
    sd.skills, 
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id 
WHERE
    jpf.job_title_short = 'Data Analyst'
    AND jpf.job_work_from_home = TRUE
GROUP BY
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;

/*
┌──────────┬──────────────┐
│  skills  │ demand_count │
│ varchar  │    int64     │
├──────────┼──────────────┤
│ sql      │        15293 │
│ python   │         9973 │
│ excel    │         9274 │
│ tableau  │         8213 │
│ power bi │         5946 │
│ r        │         4714 │
│ sas      │         3430 │
│ looker   │         2153 │
│ go       │         1714 │
│ aws      │         1658 │
└──────────┴──────────────┘
*/

/* 
Key Findings:
-Running the SQL queries allowed for the job postings to be filtered to be applicable to only data analysts/engineers.
-After the query, the findings indicate that there a number of skills that are in demand for both roles. They are as follows:
---Data Engineers:
-----SQL, Python, and AWS
---Data Analysts:
-----SQL, Python, and Excel

Knowing this information, we can gather that SQL and Python are both valuable skills to have in each role, but we do not the salary information for the roles presented.
The next query will further organize the skills further based on monetary compensation.*/