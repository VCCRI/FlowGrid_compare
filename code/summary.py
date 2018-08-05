from collections import defaultdict
import pandas as pd
import numpy as np
import re
rec=re.compile(r"StemCell_(\d+)")
rec1=re.compile(r"GvHD_(\d+)")
rec2=re.compile(r"Lymph_(\d+)")
rec3=re.compile(r"thompson(\d+)")
rec_list=[rec,rec1,rec2,rec3]
name_d={0:"StemCell",1:"GvHD",2:"Lymph"}
df=pd.read_csv("../result/single.csv",sep=",")
data=np.array(df)
d=defaultdict(list)
for i in data:
	t=True
	for k,rec in enumerate(rec_list):
		find=rec.findall(i[0])
		if find:
			if k==3:
				break
			d[name_d[k]].append(find+list(i[1:]))
			t=False
			break

	if t:
		d["M"].append([i[0]]+list(i[1:]))
key_list,m_list,st_list=[],[],[]
for k,i in d.items():
	i=np.array(i,dtype=float)
	m=np.round_(np.mean(i,axis=0)[1:],2)
	st=np.round_(np.std(i,axis=0)[1:],2)
	m_list.append(m)
	st_list.append(st)
	key_list.append(k)
m_a=np.array(m_list)
st_a=np.array(st_list)
a,b=m_a.shape
ans_list=[["" for j in range(b+1)] for i in range(a)]
for i in range(a):
	ans_list[i][0]=key_list[i]
	for j in range(b):
		if j==1:
			ans_list[i][j+1]=str(int(m_a[i,j]))
		else:
			ans_list[i][j+1]=str(m_a[i,j])+";"+str(st_a[i,j])
ans_array=np.array(ans_list)
df2=pd.DataFrame(ans_array,columns=["dataset"]+list(df.columns[1:]))
df2.to_csv("../result/summary.csv",sep=",")