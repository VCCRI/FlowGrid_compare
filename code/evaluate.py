from sklearn.metrics import adjusted_rand_score as ARI
from sklearn.metrics import confusion_matrix as cm
import numpy as np
import sys
import matplotlib
matplotlib.use("agg")
import matplotlib.pyplot as plt
import seaborn as sns

loc_d,data,alg,loc_l=[sys.argv[i] for i in range(1,5)]
pred_file="../"+loc_d+"/"+data+"_"+alg+"_predict.csv"
label_file="../"+loc_l+"/"+data+"_label.csv"
if alg!="Flock":
	label=np.genfromtxt(pred_file, delimiter='\t', skip_header=1)
	
else:
	label=np.genfromtxt(pred_file, delimiter='\t')
true_label=np.genfromtxt(label_file, delimiter='\t')
true_label=np.array(true_label).reshape(-1)
label=np.array(label).reshape(-1)
print(alg+",ARI,"+data+","+str(round(ARI(label,true_label),4)))

'''
cma=cm(label,true_label)
sns.heatmap(cma, annot=True)
plt.savefig(data+"_"+alg+".png")'''