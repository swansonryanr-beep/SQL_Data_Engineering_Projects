/*
Question:
-What are the highest paying skills for data engineers and data analysts?
-Calculate the median salary for each skill required in data engineer positions
-Focus on remote positions
-Include skill frequency to identify both salary and demand
-WHY?: Helps idenmtify which skills command the highest compensation while also showing how common these skills are, providing more insight for skill development priorities
*/

SELECT 
    sd.skills, 
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
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
HAVING
    COUNT(jpf.*) > 100
ORDER BY 
    median_salary DESC
LIMIT 25;

/*
┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ golang     │      184000.0 │          912 │
│ terraform  │      184000.0 │         3248 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ bitbucket  │      155000.0 │          478 │
│ django     │      155000.0 │          265 │
│ crystal    │      154224.0 │          129 │
│ c          │      151500.0 │          444 │
│ atlassian  │      151500.0 │          249 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ ruby       │      150000.0 │          736 │
│ css        │      150000.0 │          262 │
│ node       │      150000.0 │          179 │
│ airflow    │      150000.0 │         9996 │
│ redis      │      149000.0 │          605 │
│ vmware     │      148798.0 │          136 │
│ ansible    │      148798.0 │          475 │
│ jupyter    │      147500.0 │          400 │
└────────────┴───────────────┴──────────────┘
*/

SELECT 
    sd.skills, 
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
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
HAVING
    COUNT(jpf.*) > 100
ORDER BY 
    median_salary DESC
LIMIT 25;

/*
┌──────────────┬───────────────┬──────────────┐
│    skills    │ median_salary │ demand_count │
│   varchar    │    double     │    int64     │
├──────────────┼───────────────┼──────────────┤
│ typescript   │      445000.0 │          132 │
│ perl         │      158000.0 │          115 │
│ pyspark      │      153026.0 │          273 │
│ kafka        │      145538.0 │          141 │
│ jira         │      145000.0 │          798 │
│ zoom         │      145000.0 │          217 │
│ scala        │      135000.0 │          252 │
│ shell        │      117300.0 │          145 │
│ airflow      │      114250.0 │          552 │
│ c            │      112850.0 │          373 │
│ linux        │      112500.0 │          282 │
│ ssis         │      110000.0 │          444 │
│ databricks   │      110000.0 │          776 │
│ dax          │      110000.0 │          544 │
│ hadoop       │      107500.0 │          474 │
│ db2          │      106850.0 │          114 │
│ t-sql        │      106500.0 │          204 │
│ php          │      105000.0 │          136 │
│ scikit-learn │      103500.0 │          132 │
│ javascript   │      103250.0 │          859 │
│ unix         │      103000.0 │          106 │
│ spark        │      102500.0 │          639 │
│ go           │      102250.0 │         1714 │
│ confluence   │      101500.0 │          300 │
│ sql server   │      100200.0 │         1102 │
└──────────────┴───────────────┴──────────────┘
*/

/* 
Key Findings:
-After running the SQL queries, there a number of skills that are valuable. Additionally, roles presented differ between engineers and analysts.
-Starting with Data Engineers, the top 3 paying skills are:
---Data Engineers: Rust, Golang, and Terraform
-For Data Analysts, the top 3 are as follows:
---Data Analysts: Typescript, Perl, and Pyspark

The skills presented boast a high salary potential, however the demand count varies greatly, showing Typescript offering $445_000 salary, but little demand, as an example. 
The next query will take these findings and compare with both compensation and demand count, showing the optimal skills to learn first.*/