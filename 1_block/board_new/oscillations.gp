set term pdf
set output "single_block.pdf"
set termoption font "Times,8"
set border lw 0.5
set samples 10000

set multiplot

#WAVEFORMS

set label at graph -0.11,1 "{/:Bold a}" font ",10"
set tmargin 0
set bmargin 0
set size 0.58,0.2
set origin 0.015,0.775
unset xlabel
set ylabel "V (V)"
set xrange [-0.025:0.025]
unset xtics
set x2r [-0.025:0.025]
set x2tics in mirror
set format x2 ""
set yrange [-0.5:3]
#set format y "%.1f"
set ytics 0,1,3
plot "board_wf_avg_avg.dat" u 1:3 w l notitle lc "red" lw 0.5
replot "../breadboard/paper_implementation_op27/bread_wf_avg_avg.dat" u 1:3 w l notitle lc "blue" lw 0.5

unset label
set label at graph -0.11,1 "{/:Bold b}" font ",10"
set tmargin 0
set bmargin 0
set size 0.58,0.2
set origin 0.015,0.55
set xlabel "t (ms)"
set ylabel "W (V)"
set ytics -1,1,1
set yrange [-1.4:1.4]
set xtics ("0" -0.025, "10" -0.015, "20" -0.005, "30" 0.005, "40" 0.015, "50" 0.025)
plot "board_wf_avg_avg.dat" u 1:2 w l notitle lc "red" lw 0.5
replot "../breadboard/paper_implementation_op27/bread_wf_avg_avg.dat" u 1:2 w l notitle lc "blue" lw 0.5

#LISSAJOUS

unset label
set label at graph -0.14,1 "{/:Bold c}" font ",10"
set tmargin 0
set bmargin 0
set size 0.38,0.42
set origin 0.62,0.55
set xlabel "W (V)"
set ylabel "V (V)"
set xrange [-2:2]
set yrange [-0.5:3]
unset xtics
set x2r [-2:2]
set x2tics in mirror
set format x2 ""
set xtics -2,1,2
set ytics 0,1,3
plot "board_wf_avg_avg.dat" u 2:3 w l notitle lc "red" lw 0.5
replot "../breadboard/paper_implementation_op27/bread_wf_avg_avg.dat" u 2:3 w l notitle lc "blue" lw 0.5

#FREQUENCY

unset label
set label at graph -0.14,1 "{/:Bold d}" font ",10"
set tmargin 0
set bmargin 0
set size 0.48,0.35
set origin 0,0.08
set xlabel "V_d (V)"
set ylabel "f (Hz)"
set xrange [-0.1:3.1]
set yrange [150:230]
set ytics 150,10,230
unset xtics
set x2r [-0.1:3.1]
set x2tics in mirror
set format x2 ""
set xtics 0,0.5,3
plot "measurements_block_1.txt" u 1:3 w l notitle lc "dark-red" lw 0.5
replot "measurements_block_1.txt" u 1:3 w p lc "dark-red" ps 0.2 pt 5 notitle
replot "../breadboard/paper_implementation_op27/measurements.txt" u 1:3 w l notitle lc "dark-blue" lw 0.5
replot "../breadboard/paper_implementation_op27/measurements.txt" u 1:3 w p lc "dark-blue" ps 0.2 pt 5 notitle

#AMPLITUDE

unset label
set label at graph -0.14,1 "{/:Bold e}" font ",10"
set tmargin 0
set bmargin 0
set size 0.48,0.35
set origin 0.52,0.08
set xlabel "V_d (V)"
set ylabel "RMS(W) (V)"
set xrange [-0.1:3.1]
set yrange [0.2:2]
set ytics 0.2,0.2,2
unset xtics
set x2r [-0.1:3.1]
set x2tics in mirror
set format x2 ""
set xtics 0,0.5,3
plot "measurements_block_1.txt" u 1:2 w l notitle lc "dark-red" lw 0.5
replot "measurements_block_1.txt" u 1:2 w p lc "dark-red" ps 0.2 pt 5 notitle
replot "../breadboard/paper_implementation_op27/measurements.txt" u 1:2 w l notitle lc "dark-blue" lw 0.5
replot "../breadboard/paper_implementation_op27/measurements.txt" u 1:2 w p lc "dark-blue" ps 0.2 pt 5 notitle