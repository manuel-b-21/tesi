set term pdf
set output "two_blocks_chaos.pdf"
set termoption font "Times,8"
set border lw 0.5
set samples 10000

set multiplot

#WAVEFORMS

#set label at graph -0.11,1 "{/:Bold a}" font ",10"
set tmargin 0
set bmargin 0
set size 0.58,0.2
set origin 0.015,0.775
unset xlabel
set xrange [0:0.1]

unset xtics
set x2r [0:0.1]
set x2tics in mirror
set format x2 ""
set format y "%.1f"
set ylabel "V_1 (V)"
set ytics -0.4,0.4,1.4
set yrange [-0.401:1.401]
plot "2_blocks_avg.dat" u 1:2 w l notitle lc "blue" lw 0.5

unset label
#set label at graph -0.11,1 "{/:Bold b}" font ",10"
set tmargin 0
set bmargin 0
set size 0.58,0.2
set origin 0.015,0.55
set xlabel "t (ms)"
set ylabel "W_1 (V)"
unset yrange
set xtics ("0" 0, "20" 0.02, "40" 0.04, "60" 0.06, "80" 0.08, "100" 0.1)
set ytics -1.0,1.0,1.0
plot "2_blocks_avg.dat" u 1:3 w l notitle lc "blue" lw 0.5


#LISSAJOUS

unset label
#set label at graph -0.14,1 "{/:Bold c}" font ",10"
set tmargin 0
set bmargin 0
set size 0.38,0.42
set origin 0.62,0.55
set xlabel "W_1 (V)"
set ylabel "V_1 (V)"
unset xtics
set x2r [-2.5:2.5]
set x2tics in mirror
set format x2 ""
set xtics -2,1,2
set ytics -0.4,0.4,1.4
set xrange [-2:2]
set yrange [-0.5:1.5]
plot "2_blocks_avg.dat" u 3:2 every ::0::10000 w l notitle lc "blue" lw 0.5