from collections import defaultdict
import pandas as pd
import numpy as np
import sys
import re

filename=sys.argv[1]
rec_shape=re.compile(r"(.+)_(\d+)_(\d+)")
rec_time=re.compile(r"(\w+)_time,(.+),(\d+.\d+)")
rec_ari=re.compile(r"(\w+),ARI,(.+),(\d+.\d+)")
rec_flock_name=re.compile(r"data/(.*)_data\.csv")
file=open(filename,"r")
lines=file.readlines()
res_dict={}
shape_dict={}
for i in lines:
	i=i.strip()
	find=rec_time.findall(i)
	if find:
		method,ind,res=find[0]
		if method=="flock":
			ind=rec_flock_name.findall(ind)[0]
			method="Flock"
		if method not in res_dict:
			res_dict[method]=defaultdict(list)
		res_dict[method]["time"].append((ind,float(res)))
	else:
		find=rec_ari.findall(i)
		if find:
			method,ind,res=find[0]
			res_dict[method]["ARI"].append((ind,float(res)))
		else:
			find=rec_shape.findall(i)
			if find:
				file,n,d=find[0]
				shape_dict[file]=(int(n),int(d))
time_array=np.zeros((len(shape_dict),len(res_dict)+2))
ari_array=np.zeros((len(shape_dict),len(res_dict)))
key_list=list(shape_dict.keys())
for k,i in enumerate(key_list):
	time_array[k,0:2]=shape_dict[i]
keys=res_dict.keys()
for index,k, in enumerate(keys):
	value_dict=res_dict[k]
	for k1,value_list in value_dict.items():
		for ind,value in value_list:
			try:
				cindex=key_list.index(ind)
			except ValueError:
				pass
			if k1=="time":
				time_array[cindex,index+2]=value
			else:
				ari_array[cindex,index]=value
time_df=pd.DataFrame(time_array,columns=["size","dimension"]+[i+"time" for i in keys])
ari_df=pd.DataFrame(ari_array,columns=[i+"ARI" for i in keys])
name_df=pd.DataFrame(key_list,columns=["filename"])
total_df=pd.concat([name_df,time_df,ari_df],axis=1)
total_df.to_csv("../result/single.csv",sep=",",index=False)