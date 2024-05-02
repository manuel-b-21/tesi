set term qt persist
set termoption font ",12"
set xlabel "w = (m-1)LT (ms)"
set ylabel "{/Symbol n}"
set size ratio 0.7
set palette rgb 34,35,36 negative
T=0.5 #sampling time in ms
unif_min=23*T
unif_max=42*T
plot "joint.dat" u (($1)*T):2:3 w image pixels not
#set obj 1 rect back from unif_min, graph 0 to unif_max, graph 1 fs noborder
#set obj 1 rect back fs solid fc "light-gray"
replot "joint_av.dat" u (($1)*T):($2==0? NaN : $2):3 w yerr pt 7 lc rgb "black" not