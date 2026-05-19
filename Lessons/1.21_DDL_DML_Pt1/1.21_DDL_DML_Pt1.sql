CREATE DATABASE IF NOT EXISTS jobs_mart;

SHOW DATABASES;

--DROP DATABASE IF EXISTS jobs_mart;

SELECT *
FROM information_schema.schemata;

USE jobs_mart;

CREATE SCHEMA IF NOT EXISTS staging;

--DROP SCHEMA staging;

CREATE TABLE staging.preferred_roles (
    role_id INTEGER,
    role_name VARCHAR
);

SELECT *
FROM information_schema.tables
WHERE table_catalog = 'jobs_mart';

DROP TABLE main.preferred_roles;