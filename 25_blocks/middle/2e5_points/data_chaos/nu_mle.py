import numpy as np

unif_min=50.5 #(m-1)L
unif_max=94.5 #(m-1)L
T=0.05 #sampling time in ms

input_nu='joint_av.dat'
nu_all=np.loadtxt(input_nu)
nu_unif=nu_all[nu_all[:,0]<unif_max]
nu_unif=nu_unif[nu_unif[:,0]>unif_min]
nu_weights=1/nu_unif[:,2]**2
nu_avg=np.average(nu_unif[:,1],weights=nu_weights)
nu_err=np.sqrt(1/sum(nu_weights))
print("ν=(%.2f±%.2f)"%(nu_avg,nu_err))

input_mle='mle.dat'
mle_all=np.loadtxt(input_mle)
mle_unif=mle_all[(mle_all[:,0]-1)*mle_all[:,1]<unif_max]
mle_unif=mle_unif[(mle_unif[:,0]-1)*mle_unif[:,1]>unif_min]
mle_unif=mle_unif[mle_unif[:,2]/T*1000<5000]
mle_unif=mle_unif[mle_unif[:,2]/T*1000>500]
mle_unif=mle_unif[mle_unif[:,2]!=0]
mle_weights=1/(mle_unif[:,3]/T*1000)**2
mle_avg=np.average(mle_unif[:,2]/T*1000,weights=mle_weights)
mle_err=np.sqrt(1/sum(mle_weights))
print("MLE=(%.0f±%.0f) Hz"%(mle_avg,mle_err))
