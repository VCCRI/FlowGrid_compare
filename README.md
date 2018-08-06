# Ultrafast clustering of single-cell flow cytometry data using FlowGrid
    Authors: Xiaoxin Ye and Joshua W. K. Ho
    Contact: j.ho@victorchang.edu.au
    Copyright © 2018, Victor Chang Cardiac Research Institute
## Prerequirement
As the code to reproduce the request require packages like numpy, matplotlib, sklearn, flowCore, flowPeaks and FlowSOM, if you have not installed those packages, you could use the code in setup to install those packages.

## Data
The zip file contains all the FlowCAP and preprocessed Multi-center data for comparing FlowGrid with other flow cytometry clustering algorithms. As the required input format of flock2.c file is csv file and each column is seperated by "\t", we changed all the file into the format for evaluation.

## Usage
The 'code' folder provide all the necessary code for reproducing the results. Before runing everything, please make sure you are runing in code folder. Once you download everything, you could use the following command to change the location.
``` Bash
cd FlowGrid_comparing/code
```
The run_all.sh file is to run all the processes. If you want to run whole thing you could run as follow
``` Bash
sh run_all.sh
```

The down.sh file is to download the Seaflow data and to precoess the data. As the data is huge, it will take long time for downloading and preprocessing.

The runSingle.sh file is to run the comparison using Flow-CAP, Multi center data and Seaflow data sets.

The ru_down.sh file is to down sample the Seaflow data set and run the comparison using down sampled data.
### Result
If you run the run_all.sh, all the result will output to result folder. In result folder there will be four files including single.csv, summary.csv, simulate_result.csv and thompson0_time.pdf. The single.csv shows the number of markers, the number of dimensions, runtime and ARI for each sample, while summary.csv summaries the result of single.csv showing the mean of the runtime and ARI for every data set. simulate_result.csv and thompson0_time.pdf show the result for the down sampling.