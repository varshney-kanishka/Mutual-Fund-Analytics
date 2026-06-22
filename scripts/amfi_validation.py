import pandas as pd

master = pd.read_csv("data/raw/01_fund_master.csv")
history = pd.read_csv("data/raw/02_nav_history.csv")

master_codes = set(master["amfi_code"])
history_codes = set(history["amfi_code"])

missing = master_codes - history_codes

print("Missing AMFI Codes")
print(missing)

print("Total Missing:", len(missing))