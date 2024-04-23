#!/bin/bash

outfile="map.dat"

echo -e "#m\tL\tnu\tdnu\ta\tda" > $outfile

mmin=2
mmax=19
Lmax=20

for m in `seq $mmin $mmax`; do
	for L in `seq 1 $Lmax`; do
		datafile="./Averaged_plateau/plateau_"$m"_"$L".dat"
		if [ -e $datafile ]; then
			gnuplot -e "m=$m" -e "L=$L" fit_driver.gp >> $outfile
		else
			echo -e $m"\t"$L"\tNaN\tNaN\tNaN\tNaN" >> $outfile
		fi
	done
	echo >> $outfile
done
