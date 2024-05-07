set terminal qt persist
set termoption font ",12"
set xlabel "w = (m-1)LT (ms)"
set ylabel "MLE (Hz)"
set size ratio 0.7
T=0.25 #sampling time in ms
set xrange [1*T:214*T]
unif_min=43
unif_max=61
stats "mle.dat" u (($1-1)*$2<unif_max && ($1-1)*$2>unif_min && $3!=0)? $3/T*1000 : NaN nooutput name "mle"
set label at graph 0.6,0.9 "MLE=(".sprintf("%d",mle_mean)."±".sprintf("%d",mle_ssd).") Hz"
plot "mle.dat" u (($1-1)*$2*T):($3==0? NaN : $3/T*1000):($4/T*1000) w yerr pt 7 ps 0.5 lc rgb "blue" notitle
replot "mle.dat" u (($1-1)*$2<unif_max && ($1-1)*$2>unif_min? ($1-1)*$2*T : NaN):($3==0? NaN : $3/T*1000):($4/T*1000)\
    w yerr pt 7 ps 0.5 lc rgb "red" notitle