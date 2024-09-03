set term pdf
set output "nu_mle_blocks.pdf"
set termoption font "Times,8"
set border lw 0.25
set samples 10000

set multiplot

#nu

set label at graph -0.13,1 "{/:Bold a}" font ",12"
set tmargin 0
set bmargin 0
set size 0.48,0.5
set origin 0,0.3
set xlabel "Number of coupled blocks"
set ylabel "{/Symbol n}"
set xrange [1.5:25.5]
set yrange [2.15:3.05]
set format y "%.1f"
set key top right
#set xtics ("2" 2, "3" 3, "4" 4, "5" 5, "6" 6, "7" 7, "8" 8, "9" 9, "10" 10, "11" 11, "12" 12, "13" 13, "14" 14, "15" 15)
plot "chaos_low.dat" u 1:2:3 w yerr pt 5 ps 0.25 lc "blue" notitle
replot "chaos_low_middle.dat" u 1:2:3 w yerr pt 5 ps 0.25 lc "red" notitle
#replot "chaos_low_divided.dat" u 1:2:3 w yerr pt 5 ps 0.25 lc "dark-blue" notitle
#replot "chaos_low_middle_divided.dat" u 1:2:3 w yerr pt 5 ps 0.25 lc "dark-red" notitle

#mle

unset label
set tmargin 0
set bmargin 0
set size 0.5,0.5
set origin 0.49,0.3
set xlabel "Number of coupled blocks"
set ylabel "MLE (Hz)"
set xrange [1.5:25.5]
set yrange [30:3000]
set format y "%.0f"
set logscale y
set label at graph -0.15,1 "{/:Bold b}" font ",12"
#set xtics ("2" 2, "3" 3, "4" 4, "5" 5, "6" 6, "7" 7, "8" 8, "9" 9, "10" 10, "11" 11, "12" 12, "13" 13, "14" 14, "15" 15)
plot "chaos_low.dat" u 1:4:5 w yerr pt 5 ps 0.25 lc "blue" notitle
replot "chaos_low_middle.dat" u 1:4:5 w yerr pt 5 ps 0.25 lc "red" notitle
#replot "chaos_low_divided.dat" u 1:4:5 w yerr pt 5 ps 0.25 lc "dark-blue" notitle
#replot "chaos_low_middle_divided.dat" u 1:4:5 w yerr pt 5 ps 0.25 lc "dark-red" notitle
