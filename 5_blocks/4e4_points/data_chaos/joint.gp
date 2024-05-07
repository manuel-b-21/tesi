set terminal qt persist
set termoption font ",12"
set xlabel "w = (m-1)LT (ms)"
set ylabel "{/Symbol n}"
set size ratio 0.7
set palette rgb 34,35,36 negative
T=0.25 #sampling time in ms
set xrange [1*T:214*T]
set yrange [1:5]
nu=2.85 #most present nu from histogram
f(x)=nu
unif_min=43*T
unif_max=61*T
set arrow from unif_min, graph 0 to unif_min, graph 1 nohead front dt 4 lc "black"
set arrow from unif_max, graph 0 to unif_max, graph 1 nohead front dt 4 lc "black"
plot "joint.dat" u (($1)*T):2:3 w image pixels notitle
replot "joint_av.dat" u (($1)*T):($2==0? NaN : $2):3 w yerr pt 7 lc rgb "black" notitle
#replot f(x) lc "red" dashtype 4 notitle
