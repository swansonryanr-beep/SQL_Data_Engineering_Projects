# Exploratory Data Analysis w/ SQL: Job Market Analysis for Data Engineers and Data Analysts (Skills to Learn Based on Demand & Compensation)
 
![Project 1 Overview](../1_EDA/Images/1_1_Project1_EDA.png) 

This project was built following along with tutorials and guidance from Luke Barousse **Youtube Link:** (https://youtube.com/@lukebarousse?si=Wy_og1il961aWH2z) as part of learning data engineering fundamentals 

While the overall project structure was inspired by the tutorial, I completed the implementation myself and used the project as a hands-on learning exercise to strengthen my SQL and analytical skills

The goal of this project was to gain practical experience with: 
- SQL query development
- Data modeling and transformations
- Multi-table joins
- Analytical data exploration
- Salary and demand analysis within the data industry

## Summary
-  **Overview:** Created **6 queries** that answered key questions about the data industry, with a focus on Data Engineers and Data Analysts 
-  **Data Modeling:** Used multi-table joins across tables to extract information and gather insights 
-  **Analytics:** Applied filtering, aggregations, sorting, and calculated metrics to identify:
    - Most in-demand skills
    - Highest-paying skills
    - Optimal skills based on both salary and demand
-  **Results:** Delivered actionable insights into valuable technical skills within the data industry, with SQL and Python emerging as the most consistently valuable across both career paths

**Short on time? Review these:**
1. [Top Demanded Skills Query](/1_EDA/01_top_demanded_skills.sql) - Skill demand analysis with multi-table joins
2. [Top Paying Skills Query](/1_EDA/02_top_paying_skills.sql) - Salary analysis using aggregations
3. [Optimal Skills Query](/1_EDA/03_optimal_skills.sql) - Combined demand/salary optimization query

## Problem & Context
This project explores common questions relevant to the data job market:
- **Most In-Demand Skills:** Which skills are most requested for Data Engineers and Data Analysts?
- **Highest Paying Skills:** Which skills command the highest salaries overall for both roles?
- **Best trade-off:** Which skills provide the strongest balance between compensation and market demand?


## Tech Stack
- **Query Engine:** DuckDB for fast analytical querying
- **Language:** SQL (ANSI-style with analytical functions)
- **Development:** Visual Studio Code + Terminal/DuckDB CLI
- **Version Control:** Git/GitHub for versioned SQL scripts

## Analysis Overview
1. [Top Demanded Skills Query](/1_EDA/01_top_demanded_skills.sql) - Identifies the 10 most in-demand skills for remote Data Engineer and Data Analyst positions
2. [Top Paying Skills Query](/1_EDA/02_top_paying_skills.sql) - Analyzes the 25 highest-paying skills with salary and demand metrics for Data Engineers and Data Analysts
3. [Optimal Skills Query](/1_EDA/03_optimal_skills.sql) - Calculates an optimal score using natural log of demand combined with median salary to identify the most valuable skills to learn for both roles

## Key Insights
- Filtered and analyzed job posting data using SQL queries to identify the most in-demand skills for both Data Engineers and Data Analysts
- Found that SQL and Python are highly valuable foundational skills shared across both career paths
- Identified the most commonly requested skills for each role:
    - Data Engineers: SQL, Python, AWS
    - Data Analysts: SQL, Python, Excel
- Found that some high-paying skills have lower overall market demand, highlighting the tradeoff between salary potential and job availability
- Identified the top-paying skills for each role:
    - Data Engineers: Rust, Golang, Terraform
    - Data Analysts: Typescript, Perl, Pyspark
- Combined salary and demand metrics to determine the most optimal skills to prioritize for career growth and employability.
- Determined the strongest overall skills based on both compensation and market demand:
    - Data Engineers: Terraform, Python, AWS, SQL, Airflow
    - Data Analysts: SQL, Tableau, Python, Excel, R

## SQL Skills Demonstrated
**Query Design**
- **Complex Joins:** Multiple table `INNER JOIN` operations across `job_postings-fact`,`skills_job_dim`, and `skills_dim`  
- **Aggregations:** 
    - `COUNT()`, `MEDIAN()`, `ROUND()`
- **Filtering:** Boolean logic with `WHERE` clauses and multiple conditions (`job_title_short`, `job_work_from_home`, `salary_year_avg IS NOT NULL`)
- **Sorting & Limiting:** `ORDER BY` with `DESC` and `LIMIT` for analysis. 

**Data Analysis Techniques**
- **Grouping:** `GROUP BY` for categorical analysis
- **Conditional Logic:** `CASE WHEN` statements for metrics
- **Mathematical Functions:** `LN()` to normalize demand metrics
- **Calculated Metrics:** Derived optimal score combining demand and median salary
- **HAVING Clause:** Filtering aggregated results (specifically skills w/ >= postings)
- **NULL Handling:** Proper filtering of incomplete records (`salary_year-avg IS NOT NULL`)

## Original project/tutorial inspiration from:
- **Luke Barousse YouTube Channel:** (https://youtube.com/@lukebarousse?si=Wy_og1il961aWH2z)

