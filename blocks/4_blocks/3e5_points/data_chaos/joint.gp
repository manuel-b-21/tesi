set fit errorvariables
set fit logfile "/dev/null"
set fit quiet
set term qt persist
set termoption font ",12"
set xlabel "w = (m-1)LT (ms)"
set ylabel "{/Symbol n}"
set size ratio 0.7
set palette rgb 34,35,36 negative
T=0.1/3 #sampling time in ms
set xrange [1*T:400*T]
#unif_min=48.5*T
#unif_max=58.5*T
#set arrow from unif_min, graph 0 to unif_min, graph 1 nohead front dt 4 lc "black"
#set arrow from unif_max, graph 0 to unif_max, graph 1 nohead front dt 4 lc "black"
#f(x) = nu_mean
#fit f(x) "joint_av.dat" using ($1*T) : \
#    (($1<unif_max/T && $1>unif_min/T && $2!=0)? $2 : NaN) : 3 yerr via nu_mean
#set label at graph 0.6,0.4 "{/Symbol n}=(".sprintf("%.2f",nu_mean)."±".sprintf("%.2f",nu_mean_err).")" front
plot "joint.dat" u (($1)*T):2:3 w image pixels notitle
replot "joint_av.dat" u (($1)*T):($2==0? NaN : $2):3 w yerr pt 7 lc rgb "black" notitle
#replot f(x) lc "red" dashtype 4 notitle
