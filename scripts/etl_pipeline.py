import os
import pandas as pd
from sqlalchemy import create_engine

# SQLite database
engine = create_engine("sqlite:///data/mutual_fund.db")

# Folder containing CSV files
folder = "data/raw"

# Load each CSV into SQLite
for file in os.listdir(folder):

    if file.endswith(".csv"):

        path = os.path.join(folder, file)

        table_name = file.replace(".csv", "").replace(" ", "_").lower()

        print(f"Loading {file} -> {table_name}")

        df = pd.read_csv(path)

        df.to_sql(
            table_name,
            engine,
            if_exists="replace",
            index=False
        )

print("\nAll datasets loaded successfully!")