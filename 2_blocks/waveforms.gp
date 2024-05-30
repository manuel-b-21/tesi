set terminal qt persist
set termoption font ",7"
set border lw 0.5

set multiplot

set label at graph -0.15,1 "{/:Bold b}" font ",10"
set tmargin 0
set bmargin 0
set size 0.5,0.4
set origin 0,0.575
set xlabel "W_2 (V)"
set ylabel "V_2 (V)"
set xrange [-2:2]
set yrange [-0.5:1.5]
plot "2_blocks_avg.csv" every ::0::10000 u 5:4 w l notitle lc "dark-red" lw 0.5

unset label
set label at graph -0.15,1.1 "{/:Bold d}" font ",10"
set tmargin 0
set bmargin 0
set size 0.5,0.125
set origin 0,0.3
unset xlabel
unset yrange
set ylabel "W_2 (V)"
set xrange [0:0.1]
unset xtics
set x2r [0:0.1]
set x2tics in mirror
set format x2 ""
set format y "%.1f"
set ytics -1.0,1.0,1.0
plot "2_blocks_avg.csv" every 10 u 1:5 w l notitle lc "dark-red" lw 0.5

unset label
set label at graph -0.15,1.1 "{/:Bold f}" font ",10"
set tmargin 0
set bmargin 0
set size 0.5,0.125
set origin 0,0.125
set xlabel "t (ms)"
set ylabel "V_2 (V)"
set ytics -0.4,0.4,1.4
set yrange [-0.401:1.401]
set xtics ("0" 0, "20" 0.02, "40" 0.04, "60" 0.06, "80" 0.08, "100" 0.1)
plot "2_blocks_avg.csv" every 10 u 1:4 w l notitle lc "dark-red" lw 0.5
