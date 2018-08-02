import pandas as pd 
import numpy as np
import sys
np.random.seed(777)
file=sys.argv[1]
out=sys.argv[2]
times=int(sys.argv[3])
df=pd.read_csv("../data/"+file+"_data.csv",sep="\t")
lf=pd.read_csv("../label/"+file+"_label.csv",sep="\t", header= None)
total_n=df.shape[0]
for i in range(times):
	n=20000*2**(i)
	select_id=np.random.choice(total_n, n, replace=False)
	select_df=df.loc[select_id,:]
	select_lf=lf.loc[select_id,:]
	select_lf.to_csv("../"+out+"/"+str(i)+"_label.csv",sep="\t",index=False,header=False)
	select_df.to_csv("../"+out+"/"+str(i)+"_data.csv",sep="\t",index=False)