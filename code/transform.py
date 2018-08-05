import pandas as pd
import numpy as np
import sys
file=sys.argv[1]
df=pd.read_csv(file,sep=',')
data_df=df[["fsc_small","fsc_perp","pe","chl_small"]]
label_df=df["pop"]
tran_df=np.arcsinh(data_df/5)
tran_df=tran_df.round(4)
tran_df.to_csv("../data/"+file[:-4]+"_data.csv",sep="\t",index=False)
label_df.to_csv("../label/"+file[:-4]+"_label.csv",sep="\t",index=False)

