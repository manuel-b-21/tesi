set terminal qt persist
set termoption font "Times,10"
set border lw 0.5

set label at graph 0.6,0.925 "n_{blocks}=3  (boundary)" font ",12"
set xlabel "W_1 (V)"
set ylabel "V_1 (V)"
set size ratio 0.8
set xrange [-2:2]
set yrange [-0.5:2.5]
plot "3_blocks_avg.dat" u 3:2 every ::0::10000 w l notitle lc "dark-blue" lw 0.5
