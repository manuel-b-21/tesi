set term pdf
set output "../plots/chaos_low.pdf"
set termoption font "Times,8"
set border lw 0.5
set fit errorvariables
set fit logfile "/dev/null"
set fit quiet
#unif_min=193 #(m-1)*L=unif_min
#unif_max=217 #(m-1)*L=unif_max
unif_min=73
unif_max=109
T=0.05 #sampling time in ms
set samples 10000

set multiplot

#HEATMAP

set label at graph -0.24,1.05 "{/:Bold a}" font ",10"
set xlabel "m"
set ylabel "L"
set tmargin 0
set bmargin 0
set size 0.4,0.4
set origin 0.025,0.55
set autoscale xfix
set autoscale yfix
set palette rgb 33,13,10
f(x)=unif_min/(x-1)
g(x)=unif_max/(x-1)
set yrange [0.5:20.5]
set ytics 2,2,20
set cbrange [1:5]
plot "map.dat" u 1:2:3 w image pixels notitle
replot "map.dat" u 1:(strcol(3) eq "nan"? $2 : NaN) w p ps 0.4 pt 8 lc "black" notitle
replot f(x) notitle dashtype 4 lc "black" lw 1
replot g(x) notitle dashtype 4 lc "black" lw 1

#HISTOGRAM

unset label
set label at graph -0.24,1.05 "{/:Bold c}" font ",10"
set ytics auto
set yrange [0:35]
set xrange [1:5]
set xlabel "{/Symbol n}"
set ylabel "# of embedding pairs"
set tmargin 0
set bmargin 0
set size 0.4,0.3
set origin 0.025,0.125
set style fill solid 0.5
plot 'bin_nu.dat' u 1:2:1 with boxes notitle palette

#JOINT

unset label
set label at graph -0.125,1.05 "{/:Bold b}" font ",10"
set errorbars 0.5
set xlabel "w = (m-1)LT (ms)"
set ylabel "{/Symbol n}" off 1,0
set tmargin 0
set bmargin 0
set size 0.59,0.4
set origin 0.455,0.55
set palette rgb 34,35,36 negative
set xrange [1*T:300*T]
set yrange [1:4.5]
#set cbtics ("0" 0, "1" 1, "2" 2, "3" 3, "4" 4)
set cbrange [0:7]
set arrow from unif_min*T, graph 0 to unif_min*T, graph 1 nohead front dt 4 lc "black" lw 0.7
set arrow from unif_max*T, graph 0 to unif_max*T, graph 1 nohead front dt 4 lc "black" lw 0.7
set label at graph 0.55,0.3 "n_{blocks}=11  (boundary)" font ",10" front
plot "joint.dat" u (($1)*T):2:3 w image pixels notitle
replot "joint_av.dat" u (($1)*T):($2==0? NaN : $2):3 w yerr pt 7 ps 0.3 lc rgb "black" notitle

#MLE

unset label
set label at graph -0.125,1.05 "{/:Bold d}" font ",10"
set bars small
set xlabel "w = (m-1)LT (ms)"
set ylabel "MLE (kHz)" off 0,0
set tmargin 0
set bmargin 0
set size 0.502,0.3
set origin 0.469,0.125
set xrange [1*T:300*T]
set yrange [0:5]
#set label at graph 0.6,0.85 "MLE=(".sprintf("%.1f",mle_mean)."±".sprintf("%.1f",mle_mean_err).") Hz" font ",7"
plot "mle.dat" u (($1-1)*$2*T):($3==0? NaN : $3/T):($4/T) w yerr pt 7 ps 0.25 lc rgb "blue" notitle
replot "mle.dat" u (($1-1)*$2<unif_max && ($1-1)*$2>unif_min? ($1-1)*$2*T : NaN):\
    ($3/T<0 || $3/T>2? NaN : $3/T):($4/T)\
    w yerr pt 7 ps 0.25 lc rgb "red" notitle
