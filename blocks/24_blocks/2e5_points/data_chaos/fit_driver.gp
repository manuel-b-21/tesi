set fit errorvariables
set fit logfile "/dev/null"
set fit quiet
set print "-"

ms=sprintf("%d", m)
Ls=sprintf("%d", L)

f(x) = a - x/nu

a=1.0
nu=2.0

fit [log(3e-4):log(0.5)] f(x) "./Averaged_plateau/plateau_".ms."_".Ls.".dat" u (log($3/100.0)):4:5 yerr via a,nu

print sprintf("%d\t%d\t%.2e\t%.2e\t%.2e\t%.2e\t%f\t%d", m, L, nu, nu_err, a, a_err, FIT_STDFIT*FIT_STDFIT, FIT_NDF)
