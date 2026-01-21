# 🛡️ Insurance Analytics Platform (DBT + Databricks)

> *A hands-on, end-to-end analytics engineering project built with real-world messiness, clear modeling intent, and production style data practices using Databricks and dbt-core, enabling scalable Bronze–Silver–Gold data processing, schema enforcement, testing, metadata driven pipeline with Autoloader, and analytics-ready data models for data driven decision..*

---

## 👋 Why I Built This Project

I wanted to create **something realistic**, not just another clean Kaggle-style project.

This project simulates how data actually arrives in organizations:

* Incomplete
* Inconsistent
* Partially missing
* Yet **valuable** if modeled correctly

Coming from an analytics background and working closely with business stakeholders, I wanted a project that:

* Reflects **real insurance data challenges**
* Uses **modern analytics tooling** (Databricks + dbt)
* Demonstrates **how raw data becomes business insight**

This repo documents that journey — step by step.

---

## 🧠 Business Context

The dataset represents **insurance customer and policy information**, including:

* Demographics (age, gender, income, marital status)
* Policy attributes (policy type, duration, start date)
* Risk indicators (health score, smoking status, credit score)
* Claims behavior (previous claims)

### Key Business Questions

* Who are our **high-risk vs low-risk customers**?
* How does **policy type** relate to claims behavior?
* Which customer segments are **more profitable or risky**?
* How can this data support **underwriting, pricing, and risk teams**?

---

## 🏗️ Architecture Overview

This project follows a **modern analytics stack**:

* **Databricks** → scalable data processing & storage
* **dbt** → transformations, testing, documentation
* **Medallion Architecture** → Bronze / Silver / Gold layers

```
Raw Files (CSV)
   ↓
Databricks (Bronze Tables)
   ↓
dbt (Silver Models – Cleaning & Standardization)
   ↓
dbt (Gold Models – Facts, Dimensions & Marts)
```

---

## 🥉 Bronze Layer – Raw Ingestion

**Goal:** Preserve data exactly as received.

What happens here:

* Raw insurance data is loaded into Databricks tables
* No business logic applied
* Only minimal schema enforcement

Why this matters:

* Acts as a **source-of-truth backup**
* Enables debugging and lineage tracking
* Mirrors how data lands in real platforms

📸 *(Screenshot idea: raw table preview in Databricks)*

---

## 🥈 Silver Layer – Cleaning & Standardization

This is where the **heavy lifting** happens.

### 1️⃣ Staging Models

Purpose:

* Rename columns
* Cast data types
* Handle missing values
* Standardize categories

Examples:

* Empty marital status → `Unknown`
* Invalid numeric values → `NULL`
* Consistent naming (`policy_type`, `customer_id`)

### 2️⃣ Intermediate Models

Purpose:

* Apply **business logic**
* Derive reusable features

Examples:

* Customer risk segmentation (Low / Medium / High)
* Claims frequency classification
* Policy duration buckets

📸 *(Screenshot idea: dbt lineage graph for silver models)*

---

## 🥇 Gold Layer – Analytics-Ready Data

This layer is built for **decision-making**.

### ⭐ Dimensions

* `dim_customer`
* `dim_policy`

Features:

* Surrogate keys
* Clean, descriptive attributes
* Ready for BI tools

### 📊 Facts

* `fct_claims`
* `fct_premiums`

Features:

* Grain clearly defined
* Foreign-key relationships enforced
* Optimized for aggregations

### 📈 Business Marts

* Risk Segmentation Mart
* Profitability Mart
* Loss Ratio Mart

These marts answer **specific business questions** without exposing complexity.

📸 *(Screenshot idea: final mart output or dbt docs view)*

---

## ✅ Data Quality & Testing

Data quality is treated as a **first-class citizen**.

Implemented using dbt tests:

* `not_null` & `unique` constraints
* Accepted values for categories
* Range checks for numeric fields
* Relationship tests between facts & dimensions

Design philosophy:

* **Fail fast** for broken pipelines
* **Warn (not fail)** for real-world data imperfections

This mirrors how mature data teams operate.

---

## 📚 Documentation & Lineage

* Every model is documented
* Column-level descriptions included
* Full lineage visible using `dbt docs`

This makes the project:

* Easy to understand for new team members
* Transparent for stakeholders
* Maintainable over time

📸 *(Screenshot idea: dbt docs lineage graph)*

---

## 🧩 Tools & Tech Stack

* **Databricks** (Delta tables)
* **dbt Core**
* **SQL** (analytics engineering style)
* **Git & VS Code**

Designed to be:

* Scalable
* Modular
* Production-aligned

---

## 🚀 What This Project Demonstrates

* Real-world data modeling
* Medallion architecture implementation
* Analytics engineering best practices
* Thoughtful trade-offs between data quality & usability
* How raw data becomes trusted insight

---

## 🔮 Future Enhancements

* Incremental models
* Snapshotting (SCD Type 2)
* dbt-expectations for advanced testing
* BI dashboard integration
* ML-ready feature store

---

## 🙌 Final Note

This project was built **intentionally**, not perfectly.

It reflects how data teams:

* Work with imperfect data
* Make design decisions
* Balance effort vs impact

If this resonates with you — or sparks a discussion — I’d love to connect.

Thanks for reading 🙏
