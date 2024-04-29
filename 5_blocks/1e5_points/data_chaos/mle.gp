set terminal qt persist
set termoption font ",12"
set xlabel "w = (m-1)LT (ms)"
set ylabel "MLE (Hz)"
set size ratio 0.7
T=0.5 #sampling time in ms
set xrange [0:120]
plot "mle_1e-2.dat" u (($1-1)*$2*T):($3==0? NaN : $3/T*1000):($4/T*1000) w yerr pt 7 ps 0.5 lc rgb "blue" t "p=0.01%"
replot "mle_3e-2.dat" u (($1-1)*$2*T):($3==0? NaN : $3/T*1000):($4/T*1000) w yerr pt 7 ps 0.5 lc rgb "green" t "p=0.03%"
replot "mle_1e-1.dat" u (($1-1)*$2*T):($3==0? NaN : $3/T*1000):($4/T*1000) w yerr pt 7 ps 0.5 lc rgb "red" t "p=0.1%"