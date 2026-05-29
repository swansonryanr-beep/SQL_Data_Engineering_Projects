-- .read Lessons/1.22_DDL_DML_Pt2/1.22_DDL_DML_Pt2.sql

USE data_jobs_clone;

CREATE OR REPLACE TABLE staging.job_postings_flat AS
SELECT
    j.job_id,
    c.name AS company_name,
    j.job_title_short,
    j.job_title,
    j.job_location,
    j.job_via,
    j.job_schedule_type,
    j.job_work_from_home,
    j.search_location,
    j.job_posted_date,
    j.job_no_degree_mention,
    j.job_health_insurance,
    j.job_country,
    j.salary_rate,
    j.salary_year_avg,
    j.salary_hour_avg
FROM data_jobs.job_postings_fact AS j
LEFT JOIN data_jobs.company_dim AS c
    ON j.company_id = c.company_id;

CREATE OR REPLACE VIEW staging.priority_jobs_flat_view AS
SELECT
    jpf.*
FROM staging.job_postings_flat AS jpf
JOIN staging.preferred_roles AS r
    ON jpf.job_title_short = r.role_name;

SELECT 
    job_title_short,
    COUNT(*) AS job_count    
FROM staging.priority_jobs_flat_view
GROUP BY job_title_short
ORDER BY job_count DESC;

CREATE TEMPORARY TABLE senior_jobs_flat_temp AS
SELECT *
FROM staging.priority_jobs_flat_view
WHERE job_title_short = 'Senior Data Engineer';

SELECT 
    job_title_short,
    COUNT(*) AS job_count    
FROM senior_jobs_flat_temp
GROUP BY job_title_short
ORDER BY job_count DESC;

SELECT COUNT(*) FROM staging.job_postings_flat;
SELECT COUNT(*) FROM staging.priority_jobs_flat_view;
SELECT COUNT(*) FROM senior_jobs_flat_temp;

DELETE FROM staging.job_postings_flat
WHERE job_posted_date < '2024-01-01';

SELECT COUNT(*) FROM staging.job_postings_flat;
SELECT COUNT(*) FROM staging.priority_jobs_flat_view;
SELECT COUNT(*) FROM senior_jobs_flat_temp;

TRUNCATE TABLE staging.job_postings_flat;

INSERT INTO staging.job_postings_flat
SELECT
    j.job_id,
    c.name AS company_name,
    j.job_title_short,
    j.job_title,
    j.job_location,
    j.job_via,
    j.job_schedule_type,
    j.job_work_from_home,
    j.search_location,
    j.job_posted_date,
    j.job_no_degree_mention,
    j.job_health_insurance,
    j.job_country,
    j.salary_rate,
    j.salary_year_avg,
    j.salary_hour_avg
FROM data_jobs.job_postings_fact AS j
LEFT JOIN data_jobs.company_dim AS c
    ON j.company_id = c.company_id
WHERE job_posted_date >= '2024-01-01';

SELECT COUNT(*) FROM staging.job_postings_flat;
SELECT COUNT(*) FROM staging.priority_jobs_flat_view;
SELECT COUNT(*) FROM senior_jobs_flat_temp;