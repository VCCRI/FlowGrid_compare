from collections import defaultdict
import pandas as pd
import numpy as np
import sys
import re

filename=sys.argv[1]
rec_time=re.compile(r"(\w+)_time,(.+),(\d+.\d+)")
rec_ari=re.compile(r"(\w+),ARI,(\w+):(\d+.\d+)")
rec_flock_name=re.compile(r".*/(.*)_data\.csv")
file=open(filename,"r")
lines=file.readlines()
res_dict={}
for i in lines:
	i=i.strip()
	find=rec_time.findall(i)
	if find:
		method,ind,res=find[0]
		if method=="flock":
			ind=rec_flock_name.findall(ind)
			if ind:
				ind=ind[0]
			method="Flock"
		if method not in res_dict:
			res_dict[method]=defaultdict(list)
		res_dict[method]["time"].append((ind,float(res)))
	else:
		find=rec_ari.findall(i)
		if find:
			method,ind,res=find[0]
			res_dict[method]["ARI"].append((ind,float(res)))
key_list=[]
max_index=0
for k,value_dict in res_dict.items():
	key_list.append(k)
	for k1,value in value_dict.items():
		try:
			cur_max=max(value,key=lambda x:int(x[0]))
		except ValueError:
			print(value)
		if cur_max[0]>max_index:
			max_index=cur_max[0]
max_index=int(max_index)
time_array=np.zeros((len(res_dict),max_index+2))
ari_array=np.zeros((len(res_dict),max_index+2))
index=0
for k,value_dict in res_dict.items():
	for k1,value_list in value_dict.items():
		for ind,value in value_list:
			ind=int(ind)
			if k1=="time":
				time_array[index,ind]=value
			else:
				ari_array[index,ind]=value
	index+=1
time_df=pd.DataFrame(time_array.T,columns=[ i+"_time" for i in key_list])
ari_df=pd.DataFrame(ari_array.T,columns=[ i+"_ari" for i in key_list])
n_df=pd.DataFrame([ 2**i*10000 for i in range(1,max_index+2)],columns=["size"])
res_df=pd.concat([n_df,time_df,ari_df],axis=1)
res_df.to_csv("../result/simulate_result.csv",sep=",",index=False)