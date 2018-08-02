installed_packages<-installed.packages()[, "Package"]
need_packages<-c("devtools","flowCore","FlowSOM","flowPeaks")
if(!require(devtools)){  
	install.packages("devtools")
}
for (i in need_packages){
	if (i %in% installed_packages){
		print(paste0(i, " is installed."))
	}else{
		print(paste0(i, " is not installed."))
		library(devtools)
		source("https://bioconductor.org/biocLite.R")
		if(i=="flowCore"){
			install_github("RGLab/flowCore",ref='trunk')
		}else{
			biocLite(i)
		}
		
	}
}



