library(flowPeaks)
library(flowCore)
set.seed(777)
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
  stop("At least one argument must be supplied (input file).", call.=FALSE)
} else if (length(args)==1) {
  args[2] = "out.txt"
}
set.seed(777)
run_flowPeaks<-function(new_df,loc,file){
  data<-data.matrix(new_df)
  t1<- system.time({fp<-flowPeaks(data)})
  label<-fp$peaks.cluster
  res_name<-paste0("../",loc,"/",file,"_FlowPeaks_predict.csv")
  write.csv(label,file=res_name, row.names = FALSE)
  string<-paste("FlowPeaks_time",file,t1[3], sep=",")
  cat(string,"\n")
  return (t1)
}

loc<- args[1]
filename<- args[2]
out_loc<-args[3]
file<-paste0("../",loc,"/",filename,"_data.csv")
MyData <- read.csv(file,  sep="\t")
t1=run_flowPeaks(MyData,out_loc,filename)