import matplotlib
matplotlib.use("agg")
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sys
file_name=sys.argv[1]
file="../result/simulate_result.csv"
df=pd.read_csv(file,sep=",")
for key in ["FlowGrid","FlowSOM","FlowPeaks","Flock"]:
    keys=key+"_time"
    x,y=df[keys],df["size"]
    xy=pd.concat([x,y],axis=1)
    xy=xy[xy[keys]>0]
    plt.loglog(xy["size"],xy[keys], basex=10,label=key)
leg = plt.legend(loc='best')
leg.get_frame().set_alpha(0.5)
plt.savefig("../result/"+file_name+"_time.pdf")