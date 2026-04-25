# Sales Data Pipeline with Medallion Architecture
This project builds a professional data warehouse for sales and returns operations. It uses a medallion architecture to move data through three stages: Bronze, Silver, and Gold. This ensures that the final reports are accurate, clean, and ready for business decisions.

## What this project develops
The system automates the transformation of raw sales records into high-quality data models:

Bronze Layer: Captures raw data from sources including customers, products, stores, and sales transactions. It keeps the data in its original format so we always have a record of the source.

Silver Layer: Cleans and validates the data. It merges sales and return information, handles data types, and applies business logic to create a reliable middle layer.

Gold Layer: Delivers the final business metrics. This is the "single source of truth" where stakeholders get their key performance indicators (KPIs) and reporting items.

Snapshots: Tracks changes in data over time. This allows the business to see how product details or sales records looked at any point in history.

Quality Control: Built-in tests ensure that values like price or quantity are never negative and that the data stays consistent.

## Why this benefits stakeholders
This pipeline solves common data problems that slow down business growth:

Trust in Numbers: Automated testing prevents bad data from reaching reports. When a stakeholder looks at a sales figure, they know it has been through multiple validation checks.

Historical Accuracy: By using snapshots, the business can perform "point in time" analysis. You can compare today's performance against historical records without losing data when source systems update.

Faster Insights: Instead of analysts spending hours cleaning CSV files, the data is delivered in a "ready to use" format. This reduces the time from data collection to making a business decision.

Scalability: The architecture is built to handle increasing volumes of sales data without breaking. As the company grows, the pipeline keeps working.

Unified View: It combines fragmented data from customers, stores, and returns into one clear picture, making it easy to identify which products are performing best and why certain items are being returned.

Technical Setup
This project runs on dbt (data build tool).

## Install dependencies: Use the provided requirements file or python environment.

Configure profile: Set up your connection to the data warehouse.

Run Seeds: Load reference data like the lookup tables.

Execute Pipeline: Run the dbt models to build the layers.

Test: Run the built-in test suite to verify data integrity.
