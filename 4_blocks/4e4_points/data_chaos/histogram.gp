set terminal qt persist
set termoption font ",12"
set xlabel "{/Symbol n}"
set ylabel "# of embedding pairs"
set size ratio 0.7
set style fill solid 0.5
stats "bin_nu.dat" u 2 nooutput
stats "bin_nu.dat" u 1 every ::STATS_index_max::STATS_index_max nooutput
set yrange [0:14]
nu=STATS_max
nu_string=sprintf("%.2f",nu)
bin_width=0.05
set label at graph 0.6,0.9 "{/Symbol n}_{max}=(".nu_string."±".sprintf("%.2f",bin_width/2).")"
set arrow from nu, graph 0 to nu, graph 1 nohead front dt 2 lc "red"
plot 'bin_nu.dat' u 1:2 with boxes notitle lc rgb "dark-green"
