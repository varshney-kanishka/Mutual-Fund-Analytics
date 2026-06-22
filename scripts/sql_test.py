import pandas as pd
from sqlalchemy import create_engine

engine = create_engine("sqlite:///data/mutual_fund.db")

query = '''
SELECT scheme_name, fund_house
FROM "01_fund_master"
LIMIT 10;
'''

df = pd.read_sql(query, engine)

print(df)