set terminal qt persist
set termoption font ",12"
set xlabel "Number of coupled blocks"
set ylabel "{/Symbol n}"
set xrange [1.5:5.5]
set yrange [2.2:2.9]
set key bottom right
set label at graph -0.14,1 "{/:Bold a}" font ",16"
set xtics ("2" 2, "3" 3, "4" 4, "5" 5)
plot "chaos.dat" u 1:2:3 w yerr pt 5 lc "black" notitle
replot "chaos.dat" u 1:2 w l lc "black" notitle
#replot "chaos.dat" u 1:6:7 w yerr pt 5 lc "green" t "Histogram"
#replot "chaos.dat" u 1:6 w l lc "green" notitle