import pandas as pd
import glob
import sqlalchemy as sa
import os

# Download the Olist dataset from Kaggle and place the CSVs in a folder called 'data/'
# https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

files = glob.glob('data/*.csv')

# Update with your PostgreSQL credentials
engine = sa.create_engine('postgresql://your_username@localhost:5432/olist')

for file in files:
    df = pd.read_csv(file)
    table_name = os.path.basename(file).replace('.csv', '')
    df.to_sql(table_name, engine, if_exists='replace', index=False)
    print(f'Loaded: {table_name}')
