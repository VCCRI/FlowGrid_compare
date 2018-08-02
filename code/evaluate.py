from sklearn.metrics import adjusted_rand_score as ARI
import numpy as np
import pandas as pd
import sys
import os

loc_d,data,alg,loc_l=[sys.argv[i] for i in range(1,5)]
pred_file="../"+loc_d+"/"+data+"_"+alg+"_predict.csv"
label_file="../"+loc_l+"/"+data+"_label.csv"

true_label=np.genfromtxt(label_file, delimiter=',')

if alg!="Flock":
	label=np.genfromtxt(pred_file, delimiter=',', skip_header=1)
	
else:
	label=np.genfromtxt(pred_file, delimiter=',')
true_label=np.array(true_label).reshape(-1)
label=np.array(label).reshape(-1)
print(alg+",ARI,"+data+","+str(round(ARI(label,true_label),4)))