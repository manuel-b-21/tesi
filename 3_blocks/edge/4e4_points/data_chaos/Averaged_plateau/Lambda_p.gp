set fit errorvariables
set fit logfile "/dev/null"
set fit quiet
set terminal qt persist
set termoption font ",12"
set xlabel "p"
set ylabel "{/Symbol L}_{pl}"
set key top right font ",10"
set size ratio 0.7
if(!exist("m")) m=2
if(!exist("L")) L=1
ms=sprintf("%d", m)
Ls=sprintf("%d", L)
xmin=0.0005
xmax=0.5
set xrange [xmin:xmax]
set logscale x
set title "Embedding pair (m,L)=(".ms.",".Ls.")"
f(x) = a - x/nu
a=1.0
nu=2.0
fit [log(xmin):log(xmax)] f(x) "plateau_".ms."_".Ls.".dat" u (log($3/100)):4:5 yerr via a,nu
g(x) = a - log(x)/nu
nus=sprintf("%.3f",nu)
nu_errs=sprintf("%.3f",nu_err)
set label "{/Symbol n}=".nus."±".nu_errs."" at graph 0.7,0.9
plot "plateau_".ms."_".Ls.".dat" u ($3/100):4:5 pt 7 lc rgb "dark-blue" w yerr notitle
replot g(x) lc rgb "red" notitle
