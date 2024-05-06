#!/bin/bash

rm -f temp.dat
bash create_joint_distribution.sh map_nu_SAC.dat 45 1.0 6.0 40 0.0 0.1 | tee temp.dat | grep -v "#" | awk '{if (NF>1) print}' | \
	awk '{printf("%03.f\t%.2f\t%f\n", $1,$2,$3)}' | sort -k 2h | \
	awk '{if (NR>1) {if ($2!=prev) {printf("\n"); print} else {print}} else print; prev=$2}' > joint_W_nu_SAC.dat
cat temp.dat | grep "#Nubar_vs_w" | cut -f 2,4,5,6,8 > average_Nu_vs_W_SAC.dat
