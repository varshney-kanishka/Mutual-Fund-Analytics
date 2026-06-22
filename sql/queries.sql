-- Total funds
SELECT COUNT(*) FROM "01_fund_master";

-- Total NAV records
SELECT COUNT(*) FROM "02_nav_history";

-- All fund houses
SELECT DISTINCT fund_house
FROM "01_fund_master";

-- Large Cap Funds
SELECT scheme_name
FROM "01_fund_master"
WHERE category='Large Cap';

-- Highest Expense Ratio
SELECT scheme_name, expense_ratio_pct
FROM "01_fund_master"
ORDER BY expense_ratio_pct DESC;