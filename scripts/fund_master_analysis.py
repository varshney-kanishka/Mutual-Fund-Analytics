import pandas as pd

# Load dataset
fund = pd.read_csv("data/raw/01_fund_master.csv")

print("=" * 70)
print("COLUMN NAMES")
print("=" * 70)
print(fund.columns.tolist())

print("\n" + "=" * 70)
print("FUND HOUSES")
print("=" * 70)
print(fund["fund_house"].unique())

print("\n" + "=" * 70)
print("CATEGORIES")
print("=" * 70)
print(fund["category"].unique())

print("\n" + "=" * 70)
print("SUB CATEGORIES")
print("=" * 70)
print(fund["sub_category"].unique())

print("\n" + "=" * 70)
print("RISK CATEGORIES")
print("=" * 70)
print(fund["risk_category"].unique())

print("\n" + "=" * 70)
print("SEBI CATEGORY CODES")
print("=" * 70)
print(fund["sebi_category_code"].unique())

print("\n" + "=" * 70)
print("PLAN TYPES")
print("=" * 70)
print(fund["plan"].unique())