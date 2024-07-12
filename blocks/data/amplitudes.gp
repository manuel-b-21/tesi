set terminal qt persist
set termoption font "Times,10"
set border lw 0.5

i=1
i_middle=1
array W_avg[24]
array W_std[24]
array W_rms[24]
array W_max[24]
array W_min[24]
array W_avg_middle[12]
array W_std_middle[12]
array W_rms_middle[12]
array W_max_middle[12]
array W_min_middle[12]

do for [n_b=2:25]{
    if(n_b==2){
        filename="../2_blocks/2_blocks_avg.csv"
    }
    else{if(n_b%2==0){
    filename=sprintf("../%d_blocks/%d_blocks.csv",n_b,n_b)
    }else{
        filename=sprintf("../%d_blocks/edge/%d_blocks.csv",n_b,n_b)
    }}
    set yrange [*:*]
    stats filename u 3 nooutput
    W_avg[i]=STATS_mean
    W_std[i]=STATS_stddev
    W_rms[i]=sqrt(STATS_sumsq/STATS_records)
    W_max[i]=STATS_max
    W_min[i]=STATS_min
    if(n_b>10){
        W_avg[i]=W_avg[i]*10
        W_std[i]=W_std[i]*10
        W_rms[i]=W_rms[i]*10
        W_max[i]=W_max[i]*10
        W_min[i]=W_min[i]*10
    }
    i=i+1
    if(n_b%2==1){
        filename_middle=sprintf("../%d_blocks/middle/%d_blocks_middle.csv",n_b,n_b)
        set yrange [*:*]
        stats filename_middle u 3 nooutput
        W_avg_middle[i_middle]=STATS_mean
        W_std_middle[i_middle]=STATS_stddev
        W_rms_middle[i_middle]=sqrt(STATS_sumsq/STATS_records)
        W_max_middle[i_middle]=STATS_max
        W_min_middle[i_middle]=STATS_min
        if(n_b>10){
            W_avg_middle[i_middle]=W_avg_middle[i_middle]*10
            W_std_middle[i_middle]=W_std_middle[i_middle]*10
            W_rms_middle[i_middle]=W_rms_middle[i_middle]*10
            W_max_middle[i_middle]=W_max_middle[i_middle]*10
            W_min_middle[i_middle]=W_min_middle[i_middle]*10
        }
        i_middle=i_middle+1
    }
}



#set xrange [1.5:25.5]
#set yrange [*:*]
#set ylabel "RMS(W) (V)"
#set xlabel "Number of coupled blocks"
#plot sample [i=2:25] '+' using (i):(W_rms[i-1]) w lp ps 0.5 pt 5 lc "blue" t "Boundary"
#replot [i=1:12] '+' using (i*2+1):(W_rms_middle[i]) w lp ps 0.5 pt 5 lc "red" t "Center"