runFlock(){
	cc -o flock2 flock2.c -lm
	echo "flock_time:"$2
	time ./flock2 ../$1/$2_data.csv
	mv population_id.txt ../$3/$2_Flock_predict.csv
}


#loc data bin_b eps k
runAllAlg(){
	python2.7 runSingleFlowGird.py $1 $2 $3 $4 $1
	Rscript runFlowSOM.R $1 $2 $5 $1
	Rscript runFlowPeaks.R $1 $2 $1
	runFlock $1 $2 $1
	for j in FlowGrid FlowSOM FlowPeaks Flock
	do
		python2.7 evaluate.py  $1 $2 $j $1 &
	done
	wait
}


#loc times bin eps k
runSingleDataset(){
	for i in `seq 0 $2`
	do
		runAllAlg $1 $i $3 $4 $5 $6 
		
	done
}

rm ../down  -r
mkdir ../down 
python down_sampling.py thompson0 down 3
rm ../down.log
runSingleDataset down 2 27 1.8 4 2>&1 |tee -a ../down.log
python read_down.py ../down.log
python plot_time_ari.py thompson0
