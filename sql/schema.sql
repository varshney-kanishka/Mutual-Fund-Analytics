-- =====================================================
-- Bluestock Mutual Fund Analytics Database Schema
-- SQLite
-- =====================================================

PRAGMA foreign_keys = ON;

---------------------------------------------------------
-- Dimension Table : Fund
---------------------------------------------------------

CREATE TABLE IF NOT EXISTS dim_fund (

    amfi_code INTEGER PRIMARY KEY,

    fund_house TEXT NOT NULL,

    scheme_name TEXT NOT NULL,

    category TEXT,

    sub_category TEXT,

    plan TEXT,

    launch_date DATE,

    benchmark TEXT,

    expense_ratio_pct REAL,

    exit_load_pct REAL,

    min_sip_amount INTEGER,

    min_lumpsum_amount INTEGER,

    fund_manager TEXT,

    risk_category TEXT,

    sebi_category_code TEXT

);

---------------------------------------------------------
-- Fact Table : NAV History
---------------------------------------------------------

CREATE TABLE IF NOT EXISTS fact_nav (

    nav_id INTEGER PRIMARY KEY AUTOINCREMENT,

    amfi_code INTEGER,

    nav_date DATE,

    nav REAL,

    FOREIGN KEY(amfi_code)
        REFERENCES dim_fund(amfi_code)

);

---------------------------------------------------------
-- Fact Table : AUM
---------------------------------------------------------

CREATE TABLE IF NOT EXISTS fact_aum (

    aum_id INTEGER PRIMARY KEY AUTOINCREMENT,

    aum_date DATE,

    fund_house TEXT,

    aum_lakh_crore REAL,

    aum_crore REAL,

    num_schemes INTEGER

);

---------------------------------------------------------
-- Fact Table : Monthly SIP
---------------------------------------------------------

CREATE TABLE IF NOT EXISTS fact_sip (

    sip_id INTEGER PRIMARY KEY AUTOINCREMENT,

    month DATE,

    sip_inflow_crore REAL,

    active_sip_accounts_crore REAL,

    new_sip_accounts_lakh REAL,

    sip_aum_lakh_crore REAL,

    yoy_growth_pct REAL

);

---------------------------------------------------------
-- Fact Table : Category Inflow
---------------------------------------------------------

CREATE TABLE IF NOT EXISTS fact_category_inflow (

    inflow_id INTEGER PRIMARY KEY AUTOINCREMENT,

    month DATE,

    category TEXT,

    net_inflow_crore REAL

);

---------------------------------------------------------
-- Fact Table : Industry Folio Count
---------------------------------------------------------

CREATE TABLE IF NOT EXISTS fact_folio (

    folio_id INTEGER PRIMARY KEY AUTOINCREMENT,

    month DATE,

    total_folios_crore REAL,

    equity_folios_crore REAL,

    debt_folios_crore REAL,

    hybrid_folios_crore REAL,

    others_folios_crore REAL

);

---------------------------------------------------------
-- Fact Table : Scheme Performance
---------------------------------------------------------

CREATE TABLE IF NOT EXISTS fact_performance (

    performance_id INTEGER PRIMARY KEY AUTOINCREMENT,

    amfi_code INTEGER,

    scheme_name TEXT,

    fund_house TEXT,

    category TEXT,

    plan TEXT,

    return_1yr_pct REAL,

    return_3yr_pct REAL,

    return_5yr_pct REAL,

    benchmark_3yr_pct REAL,

    alpha REAL,

    beta REAL,

    sharpe_ratio REAL,

    sortino_ratio REAL,

    std_dev_ann_pct REAL,

    max_drawdown_pct REAL,

    aum_crore REAL,

    expense_ratio_pct REAL,

    morningstar_rating INTEGER,

    risk_grade TEXT,

    FOREIGN KEY(amfi_code)
        REFERENCES dim_fund(amfi_code)

);

---------------------------------------------------------
-- Fact Table : Investor Transactions
---------------------------------------------------------

CREATE TABLE IF NOT EXISTS fact_transactions (

    transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,

    investor_id INTEGER,

    transaction_date DATE,

    amfi_code INTEGER,

    transaction_type TEXT,

    amount_inr REAL,

    state TEXT,

    city TEXT,

    city_tier TEXT,

    age_group TEXT,

    gender TEXT,

    annual_income_lakh REAL,

    payment_mode TEXT,

    kyc_status TEXT,

    FOREIGN KEY(amfi_code)
        REFERENCES dim_fund(amfi_code)

);

---------------------------------------------------------
-- Fact Table : Portfolio Holdings
---------------------------------------------------------

CREATE TABLE IF NOT EXISTS fact_portfolio (

    holding_id INTEGER PRIMARY KEY AUTOINCREMENT,

    amfi_code INTEGER,

    stock_symbol TEXT,

    stock_name TEXT,

    sector TEXT,

    weight_pct REAL,

    market_value_cr REAL,

    current_price_inr REAL,

    portfolio_date DATE,

    FOREIGN KEY(amfi_code)
        REFERENCES dim_fund(amfi_code)

);

---------------------------------------------------------
-- Fact Table : Benchmark Indices
---------------------------------------------------------

CREATE TABLE IF NOT EXISTS fact_benchmark (

    benchmark_id INTEGER PRIMARY KEY AUTOINCREMENT,

    benchmark_date DATE,

    index_name TEXT,

    close_value REAL

);