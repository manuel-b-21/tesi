set terminal qt persist
set termoption font ",12"
set xlabel "k"
set ylabel "{/Symbol L}(k)"
set key outside right center font ",10"
set size ratio 0.7
if(!exist("m")) m=2
if(!exist("L")) L=1
if(!exist("N")) N=0
ms=sprintf("%d", m)
Ls=sprintf("%d", L)
Ns=sprintf("%d", N)
#set xrange [0:100]
set title "Embedding pair (m,L)=(".ms.",".Ls."), N=".Ns.""
folder="./".ms."_".Ls."/"
plot "".folder."gzl_".ms."_".Ls."_1e-1_".Ns.".dat" u 3:4:5 w yerr t "p=0.1%"
replot "".folder."gzl_".ms."_".Ls."_3e-1_".Ns.".dat" u 3:4:5 w yerr t "p=0.3%"
replot "".folder."gzl_".ms."_".Ls."_1e0_".Ns.".dat" u 3:4:5 w yerr t "p=1%"
replot "".folder."gzl_".ms."_".Ls."_3e0_".Ns.".dat" u 3:4:5 w yerr t "p=3%"
replot "".folder."gzl_".ms."_".Ls."_1e1_".Ns.".dat" u 3:4:5 w yerr t "p=10%"
replot "".folder."gzl_".ms."_".Ls."_3e1_".Ns.".dat" u 3:4:5 w yerr t "p=30%"
