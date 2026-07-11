# 🏥 Insurance Analytics Lakehouse Platform

## Enterprise Analytics Engineering Solution Using Databricks, Delta Lake, PySpark & dbt

![Databricks](https://img.shields.io/badge/Databricks-EF3E42?style=flat\&logo=databricks\&logoColor=white)
![Apache Spark](https://img.shields.io/badge/Apache%20Spark-E25A1C?style=flat\&logo=apachespark\&logoColor=white)
![Delta Lake](https://img.shields.io/badge/Delta%20Lake-00ADD8?style=flat)
![dbt](https://img.shields.io/badge/dbt-FF694B?style=flat\&logo=dbt\&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat\&logo=python\&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat)

---

# 📌 Project Overview

The **Insurance Analytics Lakehouse Platform** demonstrates the design and implementation of a modern cloud-based data engineering and analytics engineering solution using **Databricks Lakehouse Architecture and dbt Core**.

The platform transforms raw insurance datasets into trusted, analytics-ready data products using a structured **Bronze → Silver → Gold Medallion Architecture**.

This project focuses on enterprise data engineering practices including:

* Scalable ETL / ELT pipeline development
* Databricks Lakehouse architecture
* Delta Lake implementation
* PySpark transformations
* dbt analytics engineering workflows
* Dimensional modeling
* Data quality validation
* Data documentation and lineage
* Business-ready analytical marts

---

# 🎯 Business Problem

Insurance organizations generate large volumes of customer, policy, claims, and transaction data from multiple operational systems.

Common challenges include:

* Data distributed across multiple sources
* Inconsistent data quality
* Limited transparency into data lineage
* Slow analytical reporting processes
* Difficulty creating trusted datasets for business teams

This project demonstrates how a modern Lakehouse architecture can solve these challenges by creating governed, reliable, and analytics-ready data assets.

---

# 🏗 Solution Architecture

The platform follows a modern Lakehouse architecture:

```
                 Source Systems

        Customer Data
        Policy Data
        Claims Data
        Transaction Data

                 |
                 ↓

          Data Ingestion Layer

          Databricks / ADF

                 |
                 ↓

=================================

             Bronze Layer

     Raw Delta Tables
     Source Preservation
     Schema Enforcement

=================================

                 |
                 ↓

             Silver Layer

     Data Cleaning
     Standardization
     Validation
     Business Transformations

=================================

                 |
                 ↓

             Gold Layer

     Dimensions
     Facts
     Business Data Marts

=================================

                 |
                 ↓

        BI & Analytics Consumption
```

---

# 🛠 Technology Stack

| Technology   | Purpose                                       |
| ------------ | --------------------------------------------- |
| Databricks   | Cloud data processing platform                |
| Apache Spark | Distributed data processing engine            |
| PySpark      | ETL transformation development                |
| Delta Lake   | Reliable storage layer with ACID transactions |
| dbt Core     | SQL transformation, testing, documentation    |
| Python       | Automation and validation workflows           |
| SQL          | Data modeling and analytical transformations  |
| Git          | Version control                               |

---

# 🥉 Bronze Layer – Raw Ingestion

## Goal

Preserve source data exactly as received while creating the foundation for downstream processing.

## Implementation

Raw insurance datasets are loaded into Databricks Delta tables.

Activities:

* Raw data ingestion
* Minimal schema enforcement
* Source preservation
* Initial validation checks

## Why Bronze Layer Matters

The Bronze layer provides:

* Source-of-truth storage
* Historical preservation
* Debugging capability
* Data lineage foundation
* Replay capability for downstream processing

## Screenshot — Bronze Raw Table Preview

<img width="1836" height="686" alt="Bronze Layer Databricks Table" src="https://github.com/user-attachments/assets/07945619-03b1-47af-964a-c1e0ccba9ee4" />

---

# 🥈 Silver Layer – Cleaning & Transformation

## Goal

Transform raw data into clean, standardized, and business-ready datasets.

The Silver layer performs:

## Data Cleaning

* Data type standardization
* Missing value handling
* Duplicate detection
* Category normalization

Examples:

```
Missing marital_status
        ↓
Unknown
```

```
Invalid numeric values
        ↓
NULL handling
```

---

## Business Transformations

Silver models create reusable business logic:

Examples:

* Customer risk segmentation
* Claim frequency classification
* Policy duration analysis
* Business rule validations

The Silver layer provides trusted datasets for analytical modeling.

---

# 🥇 Gold Layer – Analytics Ready Data Products

The Gold layer is designed for business consumption and reporting.

It follows dimensional modeling principles.

---

# ⭐ Dimension Models

## dim_customer

Customer master information including:

* Customer demographics
* Risk indicators
* Customer attributes
* Segmentation details

---

## dim_policy

Policy reference information including:

* Policy type
* Coverage details
* Policy lifecycle information
* Effective dates

---

# 📊 Fact Models

## fct_claims

Insurance claims analytical dataset.

Includes:

* Claim amount
* Claim status
* Claim dates
* Customer relationships
* Policy relationships

---

## fct_premiums

Premium transaction dataset.

Includes:

* Premium amounts
* Policy relationships
* Financial metrics

---

# 📈 Business Data Marts

Business-focused analytical models:

* Risk Segmentation Mart
* Profitability Mart
* Loss Ratio Mart

These marts provide simplified datasets for analytics teams without exposing complex transformation logic.

---

## Screenshot — Gold Layer / Analytics Output

<img width="1754" height="658" alt="Gold Layer Analytics Output" src="https://github.com/user-attachments/assets/a95d2ba2-432d-4e18-93f6-019ac9b826ad" />

---

# 🔧 dbt Analytics Engineering Workflow

The project follows modular dbt development practices.

Transformation flow:

```
Source Tables

        ↓

Bronze Models

        ↓

Silver Models

    ├── Staging Models
    │
    └── Intermediate Models

        ↓

Gold Models

    ├── Dimensions
    ├── Facts
    └── Business Marts
```

---

# ⚡ Delta Lake Implementation

Delta Lake provides reliability and scalability through:

## ACID Transactions

Ensures consistent data operations.

## MERGE Operations

Supports incremental processing patterns.

## Schema Evolution

Allows controlled schema changes.

## Time Travel

Provides historical data version access.

## OPTIMIZE & VACUUM

Improves storage management and performance.

---

# ✅ Data Quality Framework

Data quality is integrated into the transformation workflow.

Implemented validations:

* Null checks
* Unique key validation
* Accepted value checks
* Relationship testing
* Record reconciliation
* Data consistency checks

Example dbt tests:

```yaml
tests:
  - not_null
  - unique
  - relationships
  - accepted_values
```

Quality objectives:

✔ Improve trust in analytical datasets
✔ Detect pipeline issues early
✔ Maintain reliable reporting outputs

---

# 📚 Documentation & Data Lineage

The project includes documentation and lineage practices using dbt.

Capabilities:

* Model documentation
* Column-level descriptions
* Dependency tracking
* Transformation lineage

Benefits:

* Easier onboarding
* Better maintainability
* Improved governance

---

# 📂 Repository Structure

```
Insurance-Analytics-Lakehouse-Platform

│
├── README.md
├── dbt_project.yml
├── packages.yml
│
├── models
│   │
│   ├── src_bronze
│   │   └── Raw ingestion models
│   │
│   ├── src_silver
│   │   │
│   │   ├── staging
│   │   │   └── Cleaning and standardization
│   │   │
│   │   └── intermediate
│   │       └── Business transformations
│   │
│   └── src_gold
│       │
│       ├── dims
│       │   └── Dimension models
│       │
│       ├── facts
│       │   └── Fact models
│       │
│       └── marts
│           └── Business analytical models
│
├── tests
│
├── macros
│
├── snapshots
│
└── seeds
```

---

# 🚀 Running the Project

Install dbt dependencies:

```bash
dbt deps
```

Validate project:

```bash
dbt compile
```

Execute transformations:

```bash
dbt run
```

Run data quality tests:

```bash
dbt test
```

Generate documentation:

```bash
dbt docs generate
dbt docs serve
```

---

# 🧩 Engineering Challenges & Solutions

## Challenge 1: Incremental Data Processing

**Problem**

Processing changing insurance datasets efficiently.

**Solution**

Implemented Delta Lake MERGE patterns to support incremental updates.

---

## Challenge 2: Data Reliability

**Problem**

Ensuring trusted analytical datasets.

**Solution**

Implemented automated validation and reconciliation checks.

---

## Challenge 3: Data Governance

**Problem**

Maintaining transparency and traceability.

**Solution**

Applied documentation, lineage tracking, and structured modeling practices.

---

# 🚀 Future Enhancements

Planned improvements:

* Add SCD Type 2 historical tracking
* Implement incremental dbt models
* Add CI/CD deployment workflows
* Add automated pipeline monitoring
* Integrate Power BI semantic models
* Build ML-ready feature engineering pipelines

---

# ⚠️ Disclaimer

This is a personal portfolio project created to demonstrate modern data engineering and analytics engineering concepts.

No proprietary company data or confidential information is used.

---

# 👋 Connect

Interested in discussing:

* Data Engineering
* Databricks Lakehouse Architecture
* Analytics Engineering
* Cloud Data Platforms
