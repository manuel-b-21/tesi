set terminal qt persist
set termoption font ",12"
set xlabel "m"
set ylabel "L"
set size ratio 2.5
set autoscale xfix
set autoscale yfix
set palette rgb 33,13,10
plot "map.dat" u 1:2:3 w image pixels notitle
