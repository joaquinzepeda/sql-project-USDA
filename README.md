# 🧠 USDA Agricultural Production – SQL Final Project

This repository contains the final project for the **SQL for Data Science** course offered by the **University of California, Davis** on Coursera.  


## 🗂️ Project Overview

As a Data Scientist at the **United States Department of Agriculture (USDA)**, you are responsible for analyzing production data across multiple commodities and states.  
The datasets include production values of:

- 🥛 Milk
- 🧀 Cheese
- ☕ Coffee
- 🍯 Honey
- 🥚 Eggs
- 🥣 Yogurt

The goal of this project is to apply foundational SQL skills to:

- Extract and summarize production data  
- Join tables using common identifiers (e.g., `State_ANSI`)  
- Identify trends across years and states  
- Support internal reporting and strategic decisions

---

## 📦 Datasets & Tables

The following SQLite tables were created from USDA CSV files:

- `milk_production`
- `cheese_production`
- `coffee_production`
- `honey_production`
- `yogurt_production`
- `egg_production`
- `state_lookup`

> Data spans multiple years and all U.S. states, with some fields requiring cleaning (e.g., removing commas from numeric values).

---

## 🛠️ Tools Used

- **SQLite**: Lightweight relational database engine
- **DBeaver**: SQL editor and GUI for importing CSV files and running queries
- **SQL**: Basic to intermediate level queries

---

## 🧪 Practice & Final Questions

Inside the `scripts/` folder, you will find:

- `create_tables.sql` → SQL commands to create each table
- `clean_values.sql` → Update statements to remove commas from numeric fields
- `sample_queries.sql` → Practice questions for exam preparation
- `usda_final_project_queries.sql` → Final project queries for real USDA planning scenarios

---

## 🔍 Example Queries

```sql
-- Total milk production in 2023
SELECT SUM(Value) FROM milk_production WHERE Year = 2023;

-- States with cheese production > 100 million in April 2023
SELECT COUNT(DISTINCT State_ANSI) FROM cheese_production
WHERE Year = 2023 AND Period = 'APR' AND Value > 100000000;
