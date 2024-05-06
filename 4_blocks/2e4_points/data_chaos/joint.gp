set terminal qt persist
set termoption font ",12"
set xlabel "w = (m-1)LT (ms)"
set ylabel "{/Symbol n}"
set size ratio 0.7
set palette rgb 34,35,36 negative
T=0.5 #sampling time in ms
nu=2.4 #most present nu from histogram
f(x)=nu

plot "joint.dat" u (($1)*T):2:3 w image pixels notitle
replot "joint_av.dat" u (($1)*T):($2==0? NaN : $2):3 w yerr pt 7 lc rgb "black" notitle
replot f(x) lc "red" dashtype 4 notitle

