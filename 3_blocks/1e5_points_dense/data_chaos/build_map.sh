#!/bin/bash

outfile="map.dat"

echo -e "#m\tL\tnu\tdnu\ta\tda" > $outfile

mmin=2
mmax=20
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

newfile=$(cat $outfile | sed "s/.*Read 1 points/21\t21\tnan\tnan\tnan\tnan\tnan\tnan/g")
#newfile=$(cat $outfile | awk '$1 == "Read" { $0=prev }{prev=$0} 1' $outfile)
rm -f $outfile
for element in "${newfile}"; do
    echo "$element" > $outfile
done