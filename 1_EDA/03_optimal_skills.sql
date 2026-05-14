/*
What are the most optimal skills for data engineers and data analysts balancing demand and salary?
-Create a ranking column that combines demand count and median salary to identify the most valuable skills.
-Focus only on remote data engineer and data analyst positions with specified annual salaries.
-WHY?: This approach highlights skills that balance market demand and financial reward. It weighs core skills appropriately to time and demand. 
*/

SELECT 
    sd.skills, 
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS demand_count,
    ROUND(LN(COUNT(jpf.*)), 1) AS ln_demand_count,
    ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/1_000_000, 2) AS optimal_score,
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id 
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY
    sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY 
    optimal_score DESC
LIMIT 25;

/*
┌────────────┬───────────────┬──────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ demand_count │ ln_demand_count │ optimal_score │
│  varchar   │    double     │    int64     │     double      │    double     │
├────────────┼───────────────┼──────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │          193 │             5.3 │          0.97 │
│ python     │      135000.0 │         1133 │             7.0 │          0.95 │
│ aws        │      137320.0 │          783 │             6.7 │          0.91 │
│ sql        │      130000.0 │         1128 │             7.0 │          0.91 │
│ airflow    │      150000.0 │          386 │             6.0 │          0.89 │
│ spark      │      140000.0 │          503 │             6.2 │          0.87 │
│ kafka      │      145000.0 │          292 │             5.7 │          0.82 │
│ snowflake  │      135500.0 │          438 │             6.1 │          0.82 │
│ azure      │      128000.0 │          475 │             6.2 │          0.79 │
│ java       │      135000.0 │          303 │             5.7 │          0.77 │
│ scala      │      137290.0 │          247 │             5.5 │          0.76 │
│ git        │      140000.0 │          208 │             5.3 │          0.75 │
│ kubernetes │      150500.0 │          147 │             5.0 │          0.75 │
│ databricks │      132750.0 │          266 │             5.6 │          0.74 │
│ redshift   │      130000.0 │          274 │             5.6 │          0.73 │
│ gcp        │      136000.0 │          196 │             5.3 │          0.72 │
│ nosql      │      134415.0 │          193 │             5.3 │          0.71 │
│ hadoop     │      135000.0 │          198 │             5.3 │          0.71 │
│ pyspark    │      140000.0 │          152 │             5.0 │           0.7 │
│ mongodb    │      135750.0 │          136 │             4.9 │          0.67 │
│ docker     │      135000.0 │          144 │             5.0 │          0.67 │
│ r          │      134775.0 │          133 │             4.9 │          0.66 │
│ go         │      140000.0 │          113 │             4.7 │          0.66 │
│ bigquery   │      135000.0 │          123 │             4.8 │          0.65 │
│ github     │      135000.0 │          127 │             4.8 │          0.65 │
└────────────┴───────────────┴──────────────┴─────────────────┴───────────────┘
*/  

SELECT 
    sd.skills, 
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS demand_count,
    ROUND(LN(COUNT(jpf.*)), 1) AS ln_demand_count,
    ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/1_000_000, 2) AS optimal_score,
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id 
WHERE
    jpf.job_title_short = 'Data Analyst'
    AND jpf.job_work_from_home = TRUE
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY
    sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY 
    optimal_score DESC
LIMIT 25;  

/*
┌──────────┬───────────────┬──────────────┬─────────────────┬───────────────┐
│  skills  │ median_salary │ demand_count │ ln_demand_count │ optimal_score │
│ varchar  │    double     │    int64     │     double      │    double     │
├──────────┼───────────────┼──────────────┼─────────────────┼───────────────┤
│ sql      │       90000.0 │          783 │             6.7 │           0.6 │
│ tableau  │       95000.0 │          505 │             6.2 │          0.59 │
│ python   │       90000.0 │          494 │             6.2 │          0.56 │
│ excel    │       83500.0 │          441 │             6.1 │          0.51 │
│ r        │       89796.0 │          289 │             5.7 │          0.51 │
│ power bi │       90000.0 │          293 │             5.7 │          0.51 │
│ sas      │       85900.0 │          220 │             5.4 │          0.46 │
│ looker   │       87500.0 │          117 │             4.8 │          0.42 │
└──────────┴───────────────┴──────────────┴─────────────────┴───────────────┘
*/  
 
/* 
Key Findings:
-The results after the queries show the top skills for boht roles, taking into account both demand in the industry and compensation offered. 
-Additionally, the findings are sorted in descending order of optimization. Looking at the data provided we see the following: 
---Data Engineers:
-----Top 5 skills: Terraform, Python, AWS, SQL, and AirFlow.
---Data Analysts:
-----Top 5 skills: SQL, Tableau, Python, Excel, and R. 

-The findings shown reveal optimal skills that can be earned by both data engineers and analysts, with salary and demand scores.
*/
