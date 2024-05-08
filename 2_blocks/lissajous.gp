set terminal qt persist
set termoption font ",12"
set xlabel "W_2 (V)"
set ylabel "V_2 (V)"
set size square
set xrange [-2:2]
set yrange [-0.5:1.5]
plot "2_blocks.csv" every ::0::10000 u 5:4 w l notitle lc "dark-red" 