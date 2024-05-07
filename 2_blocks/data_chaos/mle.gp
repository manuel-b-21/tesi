set terminal qt persist
set termoption font ",12"
set xlabel "w = (m-1)LT (ms)"
set ylabel "MLE (Hz)"
set size ratio 0.7
T=0.5 #sampling time in ms
set xrange [1*T:154*T]
unif_min=22
unif_max=43
stats "mle.dat" u (($1-1)*$2<unif_max && ($1-1)*$2>unif_min && $3!=0)? $3/T*1000 : NaN nooutput name "mle"
set label at graph 0.6,0.9 "MLE=(".sprintf("%.1f",mle_mean)."±".sprintf("%.1f",mle_ssd).") Hz"
plot "mle.dat" u (($1-1)*$2*T):($3==0? NaN : $3/T*1000):($4/T*1000) w yerr pt 7 ps 0.5 lc rgb "blue" notitle
replot "mle.dat" u (($1-1)*$2<unif_max && ($1-1)*$2>unif_min? ($1-1)*$2*T : NaN):($3==0? NaN : $3/T*1000):($4/T*1000)\
    w yerr pt 7 ps 0.5 lc rgb "red" notitle

#set fit errorvariables
#set fit logfile "/dev/null"
#set fit quiet
#f(x) = mle + x*b
#mle=1.0
#b=0.01
#fit [22:43] f(x) "mle.dat" u (($1-1)*$2*T):($3==0? NaN : $3/T*1000):($4/T*1000) yerr via mle,b
#mle_string=sprintf("%.1f",mle)
#dmle_string=sprintf("%.1f",mle_err)
#slope_string=sprintf("%.3f",b)
#set label at graph 0.6,0.9 "MLE=(".mle_string."±".dmle_string.") Hz"
#set label at graph 0.6,0.8 "slope=".slope_string.""
#replot f(x) dashtype 4 lc "red" lw 1.5 notitle
