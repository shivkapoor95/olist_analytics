# Olist E-Commerce dbt Project

A dbt project built on the Brazilian Olist e-commerce dataset. Raw data was loaded from CSVs into a local PostgreSQL database using Python, then transformed using dbt Core.

## Tools Used
- dbt Core
- PostgreSQL
- Python (pandas, sqlalchemy)
- pgAdmin

## How to Run

Activate the virtual environment:
source ~/Documents/dbt/dbtenv/bin/activate

Test the connection:
dbt debug

Run all models:
dbt run

Run all tests:
dbt test

## Project Structure
- staging/ — cleans and recasts raw source tables
- marts/ — dimension and fact tables ready for analysis

## Models
- dim_customers, dim_products, dim_sellers
- fct_orders — order level metrics including delivery time and payment totals
- fct_order_items — item level revenue and freight data