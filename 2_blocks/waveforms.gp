set terminal qt persist
set termoption font ",12"
set xrange [0:0.1]

set multiplot layout 2,1 columnsfirst

set ylabel "W_2 (V)"
set size ratio 0.3
plot "2_blocks.csv" u 1:5 w l notitle lc "dark-red"

set size ratio 0.3
set xlabel "t (s)"
set ylabel "V_2 (V)"
set ytics -0.4,0.4,1.4
set yrange [-0.401:1.401]
plot "2_blocks.csv" u 1:4 w l notitle lc "dark-red"
