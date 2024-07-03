set fit errorvariables
set fit logfile "/dev/null"
set fit quiet
set terminal qt persist
set termoption font ",12"
set xlabel "w = (m-1)LT (ms)"
set ylabel "MLE (Hz)"
set size ratio 0.7
T=0.05 #sampling time in ms
set xrange [1*T:300*T]
#set yrange [0:70]
unif_min=71
unif_max=106
#stats "mle.dat" u (($1-1)*$2<unif_max && ($1-1)*$2>unif_min && $3!=0)? $3/T*1000 : NaN nooutput name "mle"
f(x) = mle_mean
fit [*:*][500:1500] f(x) "mle.dat" using (($1-1)*$2*T) : \
    ((($1-1)*$2<unif_max && ($1-1)*$2>unif_min && $3!=0)? $3/T*1000 : NaN) : ($4/T*1000) yerr via mle_mean
set label at graph 0.6,0.9 "MLE=(".sprintf("%.0f",mle_mean)."±".sprintf("%.0f",mle_mean_err).") Hz"
plot "mle.dat" u (($1-1)*$2*T):($3==0? NaN : $3/T*1000):($4/T*1000) w yerr pt 7 ps 0.5 lc rgb "blue" notitle
replot "mle.dat" u (($1-1)*$2<unif_max && ($1-1)*$2>unif_min? ($1-1)*$2*T : NaN):\
    ($3/T<0.5 || $3/T>1.5? NaN : $3/T*1000):($4/T*1000)\
    w yerr pt 7 ps 0.5 lc rgb "red" notitle
