set terminal qt persist
set termoption font ",12"
set xlabel "m"
set ylabel "L"
set size ratio 1
set autoscale xfix
set autoscale yfix
set palette rgb 33,13,10
<<<<<<< HEAD
set samples 10000
#set linetype 1 linetype 9 linecolor "black"
unif_min=23 #(m-1)*L=unif_min
unif_max=42 #(m-1)*L=unif_max
f(x)=unif_min/(x-1)
g(x)=unif_max/(x-1)
set xrange [1.5:20.5]
set yrange [0.5:20.5]
plot f(x) notitle dashtype 4 lc "black" lw 2
replot g(x) notitle dashtype 4 lc "black" lw 2
#plot "map.dat" u 1:2:3 w image pixels notitle
=======
unif_min=23 #(m-1)*L=23
unif_max=42 #(m-q)*L=42
f(x)=unif_min/(x-1)
g(x)=unif_max/(x-1)
set yrange [0.5:20.5]
plot "map.dat" u 1:2:3 w image pixels notitle, f(x) dashtype 4 lc "black" lw 2 notitle, g(x) dashtype 4 lc "black" lw 2 notitle
>>>>>>> 751c655c397ccd80a657a0ab0b50eaedf73f86ed
