# 📊 Power BI Sales Dashboard with SQL Analysis  

## Overview  
This project demonstrates how I combined SQL for data analysis with Power BI for interactive visualization.  
Using a transactional sales database, I analyzed customer behavior, product performance, regional trends, and time-based sales patterns.  
The goal was to create an end-to-end project that mimics real-world business intelligence workflows.  

---

## Tools & Technologies  
- MySQL (data storage, cleaning, analysis)  
- SQL (joins, aggregations, grouping, date formatting)  
- Power BI (dashboard creation, interactive reporting)  
- Excel/CSV (optional intermediate data handling)  

---

## Files in this Repository  
- `db_dump.sql` -> Full database dump (tables + data)  
- `Sales_Analysis.sql` -> SQL queries used for analysis  
- `Dashboard.pbix` -> Power BI dashboard file  
- `screenshots/` -> Images of the dashboard (sample visuals)  
- `README.md` -> Project documentation  

---

##  How to Use  

### 1. Import Database into MySQL  
- Create a database (e.g., `sales`).  
- Import `db_dump.sql`:  
  ```bash
  mysql -u root -p sales < db_dump.sql
**Or via MySQL Workbench -> Server -> Data Import -> select db_dump.sql.**

### 2. Run SQL Queries
- Open Sales_Analysis.sql in MySQL Workbench.
- Execute queries to generate insights (top customers, sales by product, monthly trends, etc.).

## 3. Open Dashboard in Power BI
- Open Dashboard.pbix in Power BI Desktop.
- Connect to MySQL if needed (or use exported CSVs).

- Explore interactive visualizations with filters and drilldowns.

## Key Insights

- Top Customers: The top 10 customers contributed ~40% of overall sales.
- Customer Segments: E-Commerce customers generated more sales than Brick & Mortar.
- Product Trends: Product Type A was the best-selling category.
- Regional Insights: The North Zone consistently outperformed other regions.
- Time Trends: Sales showed a seasonal peak in Q4 every year.

## Future Improvements

- Add forecasting using Python (ARIMA/Prophet).
- Automate ETL pipelines for real-time data updates.
- Enhance Power BI with advanced DAX measures.
