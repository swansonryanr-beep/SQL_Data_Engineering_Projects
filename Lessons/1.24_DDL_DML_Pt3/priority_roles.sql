-- .read Lessons/1.24_DDL_DML_Pt3/priority_roles.sql

CREATE OR REPLACE TABLE staging.priority_roles (
    role_id INTEGER PRIMARY KEY,
    role_name  VARCHAR,
    priority_lvl INTEGER
);

INSERT INTO staging.priority_roles (role_id, role_name, priority_lvl)
VALUES
    (1, 'Data Analyst', 1),
    (2, 'Data Engineer', 3),
    (3, 'Senior Data Engineer', 3),
    (4, 'Software Engineer', 4);
    

SELECT * FROM staging.priority_roles;