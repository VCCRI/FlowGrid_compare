installed_packages<-installed.packages()[, "Package"]
need_packages<-c("devtools","flowCore","FlowSOM","flowPeaks")
for (i in need_packages){
	if (i %in% installed_packages){
		print(paste0(i, " is installed."))
	}else{
		if (i=="devtools"){
			install.packages('devtools', repos='http://cran.us.r-project.org')
		}
		else{
			library(devtools)
			print(paste0(i, " is not installed."))
			source("https://bioconductor.org/biocLite.R")
			if(i=="flowCore"){
				install_github("RGLab/flowCore",ref='trunk')
			}else{
				biocLite(i)
			}
		}
	}
}



