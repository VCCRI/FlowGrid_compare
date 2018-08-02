runFlock(){
	cc -o flock2 flock2.c -lm
	echo "flock_time:"$2
	time ./flock2 ../$1/$2_data.csv
	mv population_id.txt ../$3/$2_Flock_predict.csv
}

#loc data bin_b eps k
runAllAlg(){
	python2.7 runSingleFlowGird.py $1 $2 $3 $4 FlowGrid
	Rscript runFlowSOM.R $1 $2 $5 FlowSOM
	Rscript runFlowPeaks.R $1 $2 FlowPeaks
	runFlock $1 $2 Flock
	for j in FlowGrid FlowSOM FlowPeaks Flock 
	do
		python2.7 evaluate.py  $j $2 $j label &
	done
	wait
}

runSmallDataset(){
	runAllAlg $1 Lymph_019 7  1.8 4	
	runAllAlg $1 Lymph_018 7  1.8 6
	runAllAlg $1 Lymph_011 7  1.8 6
	runAllAlg $1 Lymph_010 6  1.8 3
	runAllAlg $1 Lymph_013 9  1.5 5
	runAllAlg $1 Lymph_012 7  1.5 4
	runAllAlg $1 Lymph_015 8  1.8 5
	runAllAlg $1 Lymph_014 10  1.8 5
	runAllAlg $1 Lymph_017 4  1.1 6
	runAllAlg $1 Lymph_016 8  1.8 4
	runAllAlg $1 Lymph_008 6  1.8 3
	runAllAlg $1 Lymph_009 5  1.8 4
	runAllAlg $1 Lymph_002 5  1.8 3
	runAllAlg $1 Lymph_003 5  1.8 4
	runAllAlg $1 Lymph_001 4  1.5 3
	runAllAlg $1 Lymph_006 5  1.8 4
	runAllAlg $1 Lymph_007 6  1.8 3
	runAllAlg $1 Lymph_004 8  1.8 3
	runAllAlg $1 Lymph_005 7  1.8 7
	runAllAlg $1 Lymph_030 8  1.8 4
	runAllAlg $1 Lymph_020 9  1.8 4
	runAllAlg $1 Lymph_021 8  1.8 4
	runAllAlg $1 Lymph_022 9  1.8 6
	runAllAlg $1 Lymph_023 9  1.8 7
	runAllAlg $1 Lymph_024 7  1.5 7
	runAllAlg $1 Lymph_025 7  1.5 4
	runAllAlg $1 Lymph_026 8  1.8 4
	runAllAlg $1 Lymph_027 9  1.8 5
	runAllAlg $1 Lymph_028 7  1.8 3
	runAllAlg $1 Lymph_029 7  1.8 3
	runAllAlg $1 GvHD_006 8  1.8 7
	runAllAlg $1 GvHD_007 10  1.8 7
	runAllAlg $1 GvHD_004 8  1.5 7
	runAllAlg $1 GvHD_005 8  1.8 6
	runAllAlg $1 GvHD_002 6  1.5 9
	runAllAlg $1 GvHD_003 7  1.5 5
	runAllAlg $1 GvHD_001 7  1.5 8
	runAllAlg $1 GvHD_008 11  1.8 8
	runAllAlg $1 GvHD_009 5  1.5 12
	runAllAlg $1 GvHD_011 4  1.1 5
	runAllAlg $1 GvHD_010 9  1.8 8
	runAllAlg $1 GvHD_012 7  1.8 8
	runAllAlg $1 StemCell_019 5  1.5 5
	runAllAlg $1 StemCell_018 6  1.8 4
	runAllAlg $1 StemCell_012 8  1.8 5
	runAllAlg $1 StemCell_014 5  1.8 4
	runAllAlg $1 StemCell_017 7  1.8 6
	runAllAlg $1 StemCell_011 6  1.8 3
	runAllAlg $1 StemCell_010 5  1.8 4
	runAllAlg $1 StemCell_013 10  1.8 5
	runAllAlg $1 StemCell_015 10  1.8 6
	runAllAlg $1 StemCell_016 5  1.8 5
	runAllAlg $1 StemCell_020 5  1.5 5
	runAllAlg $1 StemCell_021 6  1.8 8
	runAllAlg $1 StemCell_022 4  1.5 4
	runAllAlg $1 StemCell_023 9  1.8 6
	runAllAlg $1 StemCell_024 5  1.8 5
	runAllAlg $1 StemCell_025 7  1.8 3
	runAllAlg $1 StemCell_026 5  1.8 7
	runAllAlg $1 StemCell_027 7  1.5 7
	runAllAlg $1 StemCell_028 4  1.8 3
	runAllAlg $1 StemCell_029 8  1.8 6
	runAllAlg $1 StemCell_030 6  1.8 3
	runAllAlg $1 StemCell_008 7  1.8 5
	runAllAlg $1 StemCell_009 6  1.8 6
	runAllAlg $1 StemCell_006 4  1.5 3
	runAllAlg $1 StemCell_007 5  1.5 5
	runAllAlg $1 StemCell_004 5  1.5 6
	runAllAlg $1 StemCell_005 4  1.5 3
	runAllAlg $1 StemCell_002 7  1.8 4
	runAllAlg $1 StemCell_003 5  1.8 3
	runAllAlg $1 StemCell_001 5  1.8 8
	runAllAlg $1 1 4  1.1 7
	runAllAlg $1 2 4  1.1 7
	runAllAlg $1 3 4  1.1 9
	runAllAlg $1 4 4  1.1 7
	runAllAlg $1 5 4  1.1 10
	runAllAlg $1 6 5  1.1 9
	runAllAlg $1 7 4  1.1 9
	runAllAlg $1 8 4  1.1 7
    runAllAlg $1 9	5	1.1	13
    runAllAlg $1 10	4	1.1	7
    runAllAlg $1 11	4	1.1	12
    runAllAlg $1 12	4	1.1	18
    runAllAlg $1 13	4	1.1	17
    runAllAlg $1 14	4	1.1	8
    runAllAlg $1 15	4	1.1	11
    runAllAlg $1 16	4	1.1	8

}
runLargeDataset(){
	runAllAlg $1 thompson11 8  1.5 4
	runAllAlg $1 thompson1 6  1.1 29
	runAllAlg $1 thompson0 27  1.8 4
}

rm ../single.log
rm ../Flock ../FlowPeaks ../FlowSOM ../FlowGrid ../result -r
mkdir ../Flock ../FlowPeaks ../FlowSOM ../FlowGrid  ../result
runSmallDataset "data" 2>&1 |tee -a ../single.log
python readSingle.py ../single.log
python summary.py
'''
The following function is to run the seaflow data set
runLargeDataset "data" 2>&1 |tee -a ../single.log
python readSingle.py ../single.log
'''
