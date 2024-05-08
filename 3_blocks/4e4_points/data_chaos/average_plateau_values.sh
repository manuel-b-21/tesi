#!/bin/bash

mmin=2
mmax=13
Lmax=20

for m in `seq $mmin $mmax`; do
	for L in `seq 1 $Lmax`; do
		srcdir="./PlateauValues/"$m"_"$L
		dstfile="./Averaged_plateau/plateau_"$m"_"$L".dat"
		rm -f $dstfile
		echo $m $L

		for p in `echo "1e-1 3e-1 1e0 3e0 1e1 3e1"`; do
			srcfile=$srcdir"/plateau_"$m"_"$L"_"$p".dat"
			if [ -e $srcfile ]; then
				echo $m $L $p
				Lambda=$(cat $srcfile | awk '{print $6}' | statistics | awk '{print $2}')
				dLambda=$(cat $srcfile | awk '{print $6}' | statistics -s | awk '{print $3}')
				echo -e $m"\t"$L"\t"$p"\t"$Lambda"\t"$dLambda >> $dstfile
			fi
		done
	done
done
