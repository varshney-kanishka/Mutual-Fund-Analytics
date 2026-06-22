from sqlalchemy import create_engine, text

engine = create_engine("sqlite:///data/mutual_fund.db")

with engine.connect() as conn:
    result = conn.execute(text("SELECT name FROM sqlite_master WHERE type='table';"))

    print("Tables in Database:\n")

    for row in result:
        print(row[0])