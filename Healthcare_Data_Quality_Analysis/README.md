# Healthcare Data Quality Analysis

![Overview](../Healthcare_Data_Quality_Analysis/Images/Results_Data_Quality_Analysis.png)

This project transformed a manual Excel-based provider audit process into a repeatable SQL workflow using DuckDB/MotherDuck to perform deeper healthcare data validation, classification, and KPI reporting.

The project focused on identifying missing provider identifiers, incomplete contract information, and overall data quality issues through structured SQL queries and analytical reporting techniques.

While the original audit process was managed manually in Excel, this project recreated and improved the workflow using SQL to demonstrate more scalable and repeatable data validation workflows.

## Executive Overview

* **Data quality auditing:** Automated a manual provider data validation process using SQL
* **Data cleansing:** Standardized provider records and validated key business fields
* **Classification logic:** Implemented risk-level categorization using SQL business rules
* **KPI reporting:** Calculated data completeness metrics and issue summaries
* **Healthcare analytics:** Demonstrated how SQL can support provider data governance and compliance workflows

## Problem & Context

Healthcare organizations rely on accurate provider data to support credentialing, network management, claims processing, and regulatory compliance. Missing provider identifiers or incomplete contract information can lead to reporting inaccuracies, operational inefficiencies, and increased manual review effort.

This project recreated a manual Excel-based provider audit process in SQL to demonstrate how healthcare data quality workflows can be automated, standardized, and scaled.

## Tech Stack

- **Database:** DuckDB / MotherDuck
- **Language:** SQL
- **Source Data:** Healthcare provider audit dataset
- **Development:** Visual Studio Code
- **Original Process:** Excel-based provider audit workflow

## Analysis Overview
1. Data Cleaning & Standardization
    - Renamed and standardized columns for readability and analysis
    - Validated imported provider records for consistency
2. Data Quality Validation
    - Identified missing NPI values
    - Flagged incomplete contract start/end dates
    - Reviewed records for incomplete or inconsistent provider information
3. Classification & Reporting
    - Grouped provider records by state and issue category
    - Used conditional logic to classify records by data completeness and risk level
    - Generated KPI-style summaries for reporting purposes
4. Data Completeness Metrics
    - Calculated overall data completeness percentages
    - Measured frequency of missing or incomplete values across key fields

## Analytical Findings
- Identified provider records with missing NPIs and incomplete contract data that could impact operational reporting accuracy
- Demonstrated how SQL can streamline and scale manual Excel-based auditing workflows
- Created categorized summaries that improved visibility into data quality issues by state and provider group
- Built query-driven reporting methods that could support healthcare auditing and compliance workflows
- Showed how structured SQL validation can improve consistency and reduce manual review effort

## SQL Techniques Demonstrated

### Data Validation

Used SQL validation techniques to identify incomplete or inconsistent provider records:

* `IS NULL`
* `CASE WHEN`
* Conditional business rules
* Data completeness scoring

### Aggregation & KPI Reporting

Generated operational metrics and summary statistics using:

* `COUNT()`
* `AVG()`
* `ROUND()`
* `GROUP BY`

These calculations were used to quantify data quality issues and measure overall completeness.

### Classification Logic

Implemented business rules to classify provider records into:

* Complete
* Incomplete
* High-risk
* Low-risk

This approach supports prioritization of data remediation efforts.

### Reporting & Analysis

Created summarized views of data quality issues by:

* State
* Provider group
* Issue category

These summaries improve visibility into data quality trends and operational risks.


## Before and After

### Original Dataset
![Original](../Healthcare_Data_Quality_Analysis/Images/Original_Dataset.png)

## Results 
- Identified **1 provider record with missing NPI and 2 provider records with missing contract dates**
- Calculated an overall data completeness score of **66.7%**
- Categorized records by risk level and issue type
- Created SQL-based reporting outputs for operational review

![Results](../Healthcare_Data_Quality_Analysis/Images/Results_Data_Quality_Analysis.png)

## Key Outcomes

- Automated a manual provider audit process using SQL
- Identified records with missing provider identifiers and contract information
- Calculated provider data completeness metrics
- Developed classification rules for prioritizing data quality issues
- Created repeatable reporting workflows that scale beyond Excel-based auditing

## Lessons Learned

* Importance of preserving source data while creating cleaned analytical datasets
* How missing values impact reporting accuracy
* Benefits of automating manual Excel-based validation workflows
* Using SQL to create repeatable and scalable auditing processes
* Applying conditional logic to classify records based on business rules
* Building KPI-driven reporting to monitor data quality over time

