#!/bin/bash


outputfile="mle.dat"
rm -f $outputfile

for m in `seq 2 20`; do

	for L in `seq 1 20`; do

		#flag=$(echo $m $L | awk '{w=($1-1)*$2; if ((w>=20)&&(w<=40)) {print 1} else {print 0}}')
#
		#if [ $flag -eq 0 ]; then
		#	continue;
		#fi

		echo $m $L

		cat GZL/$m"_"$L/gzl_$m"_"$L"_1e-1"*".dat" | grep -v '#' | grep -v inf | grep -v nan | averaging | \
			awk '{if ($3<2000) {print}}' | grep -v nan | grep -v inf | mle -mL $m $L -intercept | grep -v "#" >> $outputfile

	done

done

cat $outputfile | tr -s "\n" > temp.dat
mv temp.dat $outputfile
