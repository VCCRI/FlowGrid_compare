# Ultrafast clustering of single-cell flow cytometry data using FlowGrid

## Prerequirement
As the code to reproduce the request require packages like numpy, matplotlib, sklearn, flowCore, flowPeaks and FlowSOM, if you have not installed those packages, you could use the code in setup to install those packages.

## Data
The zip file contains all the FlowCAP and preprocessed Multi-center data for comparing FlowGrid with other flow cytometry clustering algorithms. As the required input format of Flock2.c file is CSV file and each column is seperated by "\t", we changed all the file into the format for evaluation.

## Usage
The code folder provide all the necessary code for reproducing the results. Before runing everything, please make sure you are runing in code folder. Once you download everything, you could use the following command to change the location.
``` Bash
cd FlowGrid_comparing/Code
```
The run_all.sh file is to run all the processes. If you want to run whole thing you could run as follow
``` Bash
sh run_all.sh
```

The down.sh file is to download the Seaflow data and to precoess the data. As the data is huge, it will take long time for downloading and preprocessing.


