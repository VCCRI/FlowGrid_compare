
#The following code is to install the required packages.

pip install -r ../setup/requirement.txt  --user
Rscript ../setup/check_library.R

## downloading the seaflow data and preprocessing them.
sh down.sh

sh runSingle.sh

sh run_down.sh