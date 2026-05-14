SELECT *
FROM skills_dim
LIMIT 5;

SELECT *
FROM information_schema.tables
WHERE table_catalog = 'data_jobs';

PRAGMA show_tables;

DESCRIBE job_postings_fact;