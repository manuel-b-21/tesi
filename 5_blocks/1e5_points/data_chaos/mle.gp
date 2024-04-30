set terminal qt persist
set termoption font ",12"
set xlabel "w = (m-1)LT (ms)"
set ylabel "MLE (Hz)"
set size ratio 0.7
T=0.5 #sampling time in ms
set xrange [0:120]
plot "mle_1e-2.dat" u (($1-1)*$2*T):($3==0? NaN : $3/T*1000):($4/T*1000) w yerr pt 7 ps 0.5 lc rgb "blue" notitle

set fit errorvariables
set fit logfile "/dev/null"
set fit quiet
f(x) = mle
mle=1.0
b=0.01
fit [60:120] f(x) "mle_1e-2.dat" u (($1-1)*$2*T):($3==0? NaN : $3/T*1000):($4/T*1000) yerr via mle,b
mle_string=sprintf("%.1f",mle)
dmle_string=sprintf("%.1f",mle_err)
print(b)
set label at graph 0.6,0.9 "MLE=(".mle_string."±".dmle_string.") Hz"
replot f(x) dashtype 4 lc "red" lw 1.5 notitle
