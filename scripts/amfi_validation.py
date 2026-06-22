import pandas as pd

fund_master = pd.read_csv("data/raw/01_fund_master.csv")
nav_history = pd.read_csv("data/raw/02_nav_history.csv")

master_codes = set(fund_master["amfi_code"])
nav_codes = set(nav_history["amfi_code"])

missing = master_codes - nav_codes
extra = nav_codes - master_codes

print("=" * 60)
print("AMFI CODE VALIDATION")
print("=" * 60)

print(f"Fund Master Codes : {len(master_codes)}")
print(f"NAV History Codes : {len(nav_codes)}")

print("\nMissing Codes in NAV History:")
print(missing)

print("\nExtra Codes in NAV History:")
print(extra)

if len(missing) == 0:
    print("\n✅ All AMFI codes are valid.")
else:
    print(f"\n❌ {len(missing)} codes are missing.")