import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine
df=pd.read_csv("projo.csv")
engine=create_engine("mysql+pymysql://root:amanjain@localhost/project_clinical")
df.to_sql("patient_data",con=engine,if_exists="replace",index=False)
# df.info()
# print(df.isnull().sum())
df.columns=df.columns.str.lower().str.strip()

df=df.loc[df["condition"]!="糖尿病"]
# print(df["condition"].value_counts())

df["admission_date"]=pd.to_datetime(df["admission_date"])
df["discharge_date"]=pd.to_datetime(df["discharge_date"])
df["recovery_days"]=df["discharge_date"]-df["admission_date"]



df.to_csv("projo.csv",index=False)
print(df.head(20))