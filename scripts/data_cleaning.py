import os
import pandas as pd

RAW_FOLDER = "data/raw"
PROCESSED_FOLDER = "data/processed"

os.makedirs(PROCESSED_FOLDER, exist_ok=True)

for file in os.listdir(RAW_FOLDER):

    if file.endswith(".csv"):

        path = os.path.join(RAW_FOLDER, file)

        df = pd.read_csv(path)

        print(f"\nCleaning {file}")

        # Remove duplicate rows
        df.drop_duplicates(inplace=True)

        # Remove leading/trailing spaces from column names
        df.columns = df.columns.str.strip()

        # Save cleaned dataset
        output = os.path.join(PROCESSED_FOLDER, file)

        df.to_csv(output, index=False)

        print("Saved:", output)

print("\nAll datasets cleaned successfully.")