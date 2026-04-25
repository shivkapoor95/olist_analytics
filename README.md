# Olist E-Commerce dbt Project

A dbt project built on the Brazilian Olist e-commerce dataset. Raw data was loaded from CSVs into a local PostgreSQL database using Python, then transformed using dbt Core.

## Tools Used
- dbt Core
- PostgreSQL
- Python (pandas, sqlalchemy)
- pgAdmin

## How to Run

1. Download the Olist dataset from Kaggle and place the CSVs in a folder called `data/` inside the project:
   https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

2. Load the CSVs into PostgreSQL:
   python load_olist.py

3. Set up your `~/.dbt/profiles.yml` to connect to your local PostgreSQL instance.
   The profile name must be: olist_analytics

4. Create and activate a virtual environment, then install dbt-postgres:
   pip install dbt-postgres

5. Install dbt packages:
   dbt deps

6. Test the connection:
   dbt debug

7. Run all models:
   dbt run

8. Run all tests:
   dbt test

## Project Structure
- staging/ — cleans and recasts raw source tables
- marts/ — dimension and fact tables ready for analysis

## Models
- dim_customers, dim_products, dim_sellers
- fct_orders — order level metrics including delivery time and payment totals
- fct_order_items — item level revenue and freight data
