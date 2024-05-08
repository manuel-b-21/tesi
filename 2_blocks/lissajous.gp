set terminal qt persist
set termoption font ",12"
set xlabel "W (V)"
set ylabel "V (V)"
set size square
plot "two_blocks_005V_10s.csv" every ::0::5000 u 3:2 w l notitle 