set terminal qt persist
set termoption font "Times,10"
set border lw 0.5

set label at graph 0.65,0.9 "n_{blocks}=21  (center)" font ",12"
set xlabel "W_{11} (V)"
set ylabel "V_{11} (V)"
set size ratio 0.8
set xrange [-2:2]
set yrange [-0.5:2.5]
plot "21_blocks_middle_avg.dat" u ($3*10):($2*10) every ::0::10000 w l notitle lc "dark-blue" lw 0.5
