import requests
import pandas as pd
import os

schemes = {
    "HDFC_Top100": 125497,
    "SBI_Bluechip": 119551,
    "ICICI_Bluechip": 120503,
    "Nippon_LargeCap": 118632,
    "Axis_Bluechip": 119092,
    "Kotak_Bluechip": 120841
}

os.makedirs("data/raw", exist_ok=True)

for name, code in schemes.items():

    url = f"https://api.mfapi.in/mf/{code}"

    response = requests.get(url)

    if response.status_code == 200:

        data = response.json()

        nav = pd.DataFrame(data["data"])

        nav.to_csv(
            f"data/raw/{name}_Live_NAV.csv",
            index=False
        )

        print(f"{name} downloaded successfully")

    else:

        print(f"Error downloading {name}")