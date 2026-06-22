# Data Quality Summary

## Project: Mutual Fund Analytics Platform

### Date
22 June 2026

---

# Overall Summary

- Total datasets loaded: **10**
- Total records: **87,533**
- Duplicate rows found: **0**
- Data ingestion: **Successful**

---

# Dataset-wise Summary

## 1. 01_fund_master.csv

- Shape: (40, 15)
- Missing Values: 0
- Duplicate Rows: 0
- Remarks:
  - Master data is complete.
  - Contains fund details such as AMFI code, fund house, category, benchmark, expense ratio, fund manager, and risk category.

---

## 2. 02_nav_history.csv

- Shape: (46,000, 3)
- Missing Values: 0
- Duplicate Rows: 0
- Remarks:
  - Large historical NAV dataset.
  - Date column should be converted from string to datetime.
  - NAV column is already numeric (float64).

---

## 3. 03_aum_by_fund_house.csv

- Shape: (90, 5)
- Missing Values: 0
- Duplicate Rows: 0
- Remarks:
  - AUM information is complete.
  - Date column should be converted to datetime.

---

## 4. 04_monthly_sip_inflows.csv

- Shape: (48, 6)
- Missing Values: 12
- Duplicate Rows: 0

### Observation

The column **yoy_growth_pct** contains 12 missing values.

### Reason

The first year's YoY growth cannot be calculated because there is no previous year's data.

### Action

Missing values will be retained for now and handled during data preprocessing.

---

## 5. 05_category_inflows.csv

- Shape: (144, 3)
- Missing Values: 0
- Duplicate Rows: 0

Remarks:
- Dataset is clean.

---

## 6. 06_industry_folio_count.csv

- Shape: (21, 6)
- Missing Values: 0
- Duplicate Rows: 0

Remarks:
- Dataset is clean.

---

## 7. 07_scheme_performance.csv

- Shape: (40, 19)
- Missing Values: 0
- Duplicate Rows: 0

Remarks:
- Performance metrics including Alpha, Beta, Sharpe Ratio, Sortino Ratio, and Max Drawdown are available.

---

## 8. 08_investor_transactions.csv

- Shape: (32,778, 13)
- Missing Values: 0
- Duplicate Rows: 0

Remarks:
- Synthetic investor transaction dataset.
- Suitable for demographic and transaction analysis.

---

## 9. 09_portfolio_holdings.csv

- Shape: (322, 8)
- Missing Values: 0
- Duplicate Rows: 0

Remarks:
- Portfolio holdings are complete.

---

## 10. 10_benchmark_indices.csv

- Shape: (8,050, 3)
- Missing Values: 0
- Duplicate Rows: 0

Remarks:
- Benchmark index history is complete.
- Date column should be converted to datetime.

---

# Data Type Improvements

The following columns should be converted during preprocessing:

- launch_date → datetime
- date (NAV History) → datetime
- date (AUM) → datetime
- month → datetime
- transaction_date → datetime
- portfolio_date → datetime

---

# Data Quality Issues Found

| Issue | Count | Status |
|--------|------:|--------|
| Missing Values | 12 | Only in `yoy_growth_pct` |
| Duplicate Rows | 0 | No action required |
| Invalid AMFI Codes | Pending Validation | To be checked |
| Null NAV Values | 0 | Good |
| Missing AUM | 0 | Good |

---

# Overall Assessment

The datasets are of **high quality** and are suitable for ETL, SQL modeling, exploratory data analysis, performance analytics, and dashboard development.

Only minor preprocessing is required:
- Convert date columns to datetime format.
- Handle the 12 missing values in `yoy_growth_pct`.

No duplicate records or major data quality issues were found.