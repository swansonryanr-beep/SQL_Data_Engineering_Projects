--.read ./Lessons/1.21_DDL_DML_Pt1/1.21_DDL_DML_Pt1.sql

  -- Switch to writable cloned database
USE data_jobs_clone;

-- View available schemas
SELECT *
FROM information_schema.schemata;

-- Create staging schema
CREATE SCHEMA IF NOT EXISTS staging;

-- Create preferred roles table
CREATE TABLE IF NOT EXISTS staging.preferred_roles (
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR
);

-- Check that the table exists
SELECT *
FROM information_schema.tables
WHERE table_catalog = 'data_jobs_clone'
  AND table_schema = 'staging';

-- Insert preferred role records
INSERT INTO staging.preferred_roles (role_id, role_name)
VALUES
    (1, 'Data Engineer'),
    (2, 'Senior Data Engineer'),
    (3, 'Software Engineer'),
    (4, 'Data Analyst');

-- View table results
SELECT *
FROM staging.preferred_roles;

ALTER TABLE staging.preferred_roles
ADD COLUMN preferred_role BOOLEAN;

UPDATE staging.preferred_roles
SET preferred_role = TRUE
WHERE role_id = 1 OR role_id=2;

UPDATE staging.preferred_roles
SET preferred_role = FALSE
WHERE role_id = 3 OR role_id=4;

ALTER TABLE staging.preferred_roles
RENAME IF EXISTS TO priority_roles;

SELECT *
FROM staging.priority_roles;

ALTER TABLE staging.priority_roles
RENAME COLUMN preferred_role TO priority_lvl;

ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INTEGER;

UPDATE staging.priority_roles
SET priority_lvl = 1
WHERE role_id = 4;

SELECT *
FROM staging.priority_roles;