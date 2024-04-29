set terminal qt persist
set termoption font ",12"
set xlabel "m"
set ylabel "L"
set size ratio 1
set autoscale xfix
set autoscale yfix
set palette rgb 33,13,10
unif_min=23 #(m-1)*L=23
unif_max=42 #(m-q)*L=42
f(x)=unif_min/(x-1)
g(x)=unif_max/(x-1)
set yrange [0.5:20.5]
plot "map.dat" u 1:2:3 w image pixels notitle, f(x) dashtype 4 lc "black" lw 2 notitle, g(x) dashtype 4 lc "black" lw 2 notitle
