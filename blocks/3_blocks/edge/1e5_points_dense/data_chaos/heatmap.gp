set terminal qt persist
set termoption font ",12"
set xlabel "m"
set ylabel "L"
set size ratio 1
set autoscale xfix
set autoscale yfix
set palette rgb 33,13,10
set samples 10000
set yrange [0.5:20.5]
set xrange [1.5:20.5]
set ytics 2,2,20
plot "map.dat" u 1:2 w p ps 1.8 pt 8 lc "black" notitle
replot "map.dat" u 1:2:($8>0? $3 : NaN) w image pixels notitle
unif_min=93 #(m-1)*L=unif_min
unif_max=117 #(m-1)*L=unif_max
f(x)=unif_min/(x-1)
g(x)=unif_max/(x-1)
replot f(x) notitle dashtype 4 lc "black" lw 2
replot g(x) notitle dashtype 4 lc "black" lw 2
