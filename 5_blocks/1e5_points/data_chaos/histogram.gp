set terminal qt persist
set termoption font ",12"
set xlabel "{/Symbol n}"
set ylabel "# of embedding pairs"
set size ratio 0.7
set style fill solid 0.5
plot 'bin_nu.dat' u 1:2 with boxes notitle lc rgb "dark-green"
