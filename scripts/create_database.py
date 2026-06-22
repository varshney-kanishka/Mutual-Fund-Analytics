from sqlalchemy import create_engine


engine = create_engine("sqlite:///data/mutual_fund.db")

connection = engine.connect()

print("Database created successfully!")

connection.close()