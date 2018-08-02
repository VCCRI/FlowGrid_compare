from FlowGrid import *
from  time import time
import pandas as pd
import numpy as np
import sys
import os
np.random.seed(seed=777)
def run_test(para,data,file):
	bin_n,eps=para
	new_data_array=np.array(data)
	t1=time()
	gd=FlowGrid(new_data_array,bin_n=bin_n,eps=eps)
	label_array=gd.clustering()
	print("FlowGrid_time,"+ file+","+str(round(time()-t1,2)))
	return label_array

loc=sys.argv[1]
file_name=sys.argv[2]
bin_n=sys.argv[3]
eps=sys.argv[4]
out=sys.argv[5]

para=int(bin_n),float(eps)
file="../"+loc+"/"+file_name+"_data.csv"
data_df=pd.read_csv(file,sep="\t")
print(file_name+"_"+str(data_df.shape[0])+"_"+str(data_df.shape[1]))
data=np.array(data_df)
label_array=run_test(para,data,file_name)
label_array=label_array.astype(int)
df=pd.DataFrame(label_array,columns=["label"])
df.to_csv("../"+out+"/"+file_name+"_FlowGrid_predict.csv", sep='\t',index=False)