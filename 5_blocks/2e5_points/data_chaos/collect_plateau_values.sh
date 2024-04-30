#!/bin/bash

mmin=2
mmax=8
Lmax=20

for m in `seq $mmin $mmax`; do
	for L in `seq 1 $Lmax`; do
		srcdir="./GZL/"$m"_"$L
		dstdir="./PlateauValues/"$m"_"$L
		mkdir -p $dstdir

		for p in `echo "1e-2 3e-2 1e-1 3e-1 1e0 3e0 1e1 3e1"`; do
			dstfile=$dstdir"/plateau_"$m"_"$L"_"$p".dat"
			rm -f $dstfile
			lstsrc=$(ls $srcdir"/gzl_"$m"_"$L"_"$p"_"*.dat)
			if [ "$lstsrc" != "" ]; then
				echo $m $L $p
				for f in $lstsrc; do
					cat $f | grep -v 'inf' | grep -v 'nan' | \
						plateau -range 2000 4000 | tail -1 | grep -v "#" >> $dstfile
				done
			fi
		done
	done
done
