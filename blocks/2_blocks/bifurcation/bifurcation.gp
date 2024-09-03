set term pdf
set output "bifurcation.pdf"
set termoption font "Times,13"
set border lw 0.5

set ylabel "max(W_1) (V)"
set xlabel "V_d (V)"
set xrange [-0.01:0.70]
plot "bifurcation.dat" u 1:2 w p notitle pt 5 ps 0.25 lc "dark-blue"
