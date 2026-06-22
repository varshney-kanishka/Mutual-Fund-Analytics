import os
import pandas as pd

DATA_FOLDER = "data/raw"

files = [f for f in os.listdir(DATA_FOLDER) if f.endswith(".csv")]

print(f"\nFound {len(files)} CSV files\n")

for file in files:

    path = os.path.join(DATA_FOLDER, file)

    print("=" * 80)
    print(f"Dataset: {file}")
    print("=" * 80)

    df = pd.read_csv(path)

    print("\nShape:")
    print(df.shape)

    print("\nData Types:")
    print(df.dtypes)

    print("\nFirst 5 Rows:")
    print(df.head())

    print("\nMissing Values:")
    print(df.isnull().sum())

    print("\nDuplicate Rows:")
    print(df.duplicated().sum())

    print("\n")