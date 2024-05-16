set terminal qt persist
set termoption font ",12"
set xlabel "Number of coupled blocks"
set ylabel "MLE (Hz)"
set xrange [1.5:5.5]
set yrange [0:25]
set label at graph -0.11,1 "{/:Bold b}" font ",16"
set xtics ("2" 2, "3" 3, "4" 4, "5" 5)
plot "chaos.dat" u 1:4:5 w yerr pt 5 lc "red" notitle
replot "chaos.dat" u 1:4 w l lc "red" notitle