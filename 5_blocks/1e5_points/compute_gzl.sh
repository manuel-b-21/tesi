#!/bin/bash

dataFile="5_blocks_005V_10s.csv"
folderName="data_chaos"

#exit

mmax=20
Lmax=20
N=1

kmin=1
kmax=2000
dk=1
downsampling=5

set OMP_NUM_THREADS=12

nThread=0

mkdir -p $folderName

for m in `seq 2 $mmax`; do
	for L in `seq 1 $Lmax`; do
		dstdir=$folderName"/GZL/"$m"_"$L
		mkdir -p $dstdir

		for p in `echo "1e-2 3e-2 1e-1 3e-1 1e0 3e0 1e1 3e1"`; do
			for n in `seq 0 $N`; do
				dstfile=$dstdir"/gzl_"$m"_"$L"_"$p"_"$n".dat"
				rm -f $dstfile

				cat $dataFile | grep -v '#' | awk -v downsampling=$downsampling '{if ((NR%downsampling)==0) print $3}' | \
					seed -cin -normal -mu 0 -sigma 0.001 | awk '{print $1+$2}' | \
					gaoZhengLambda -c 1 -mL $m $L -theiler -min $kmin -max $kmax -dk $dk -p $p > $dstfile #&

 				#nThread=$(( nThread + 1 ))
 				#stop=$(echo $nThread | awk '{if ((int($1)%8)==0) {print 1} else {print 0}}')
 				#echo $nThread $stop
 				#if [ $stop -eq 1 ]; then
 				#	wait
 				#fi
			done
		done
	done
done
