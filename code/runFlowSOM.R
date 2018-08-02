library(FlowSOM)
library(flowCore)
set.seed(777)
flowsom_clustering<-function(new_df,loc,file,k){
  data<-data.matrix(new_df)
  flow_data<-flowCore::flowFrame(data)
  t1<- system.time({
    fSOM <- FlowSOM::ReadInput(flow_data, transform = FALSE, scale = FALSE)
    fSOM <- FlowSOM::BuildSOM(fSOM)
    fSOM <- FlowSOM::BuildMST(fSOM)
    metaClustering <- metaClustering_consensus(fSOM$map$codes,k=k)
  })

  metaClustering<-unlist(metaClustering)
  n<-length(metaClustering)
  label_list<-list()
  for (i in 1:n){
    label_list[[i]]=metaClustering[i]
  }

  prelabel <- fSOM$map$mapping[, 1]
  meta_label<-prelabel

  for (i in 1:length(prelabel)){
    meta_label[i]<-label_list[prelabel[i]]
  }  
  label<-unlist(meta_label)
  res_name<-paste0("../",loc,"/",file,"_FlowSOM_predict.csv")
  write.csv(label,file=res_name, row.names = FALSE)
  string<-paste("FlowSOM_time",file,t1[3], sep=",")
  cat(string,"\n")

}

args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
  stop("At least one argument must be supplied (input file).", call.=FALSE)
}


print(args)
loc<- args[1]
filename<- args[2]
k<- as.integer(args[3])
out_loc<-args[4]
file<-paste0("../",loc,"/",filename,"_data.csv")
MyData <- read.csv(file, sep="\t")
t1<-flowsom_clustering(MyData,out_loc,filename,k)
