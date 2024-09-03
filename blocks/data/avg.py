import numpy as np

filename='chaos_low.dat'
filename_middle='chaos_low_middle.dat'

nu_vec=np.loadtxt(filename)[4:,1]
dnu_vec=np.loadtxt(filename)[4:,2]
nu_weights=1/dnu_vec**2
nu_avg=np.average(nu_vec,weights=nu_weights)
nu_err=np.sqrt(1/sum(nu_weights))
print("ν=(%.2f±%.2f)"%(nu_avg,nu_err))

mle_vec=np.loadtxt(filename)[2:,3]
dmle_vec=np.loadtxt(filename)[2:,4]
mle_weights=1/dmle_vec**2
mle_avg=np.average(mle_vec,weights=mle_weights)
mle_err=np.sqrt(1/sum(mle_weights))
print("MLE=(%d±%d)"%(mle_avg,mle_err))

mle_high_vec=np.loadtxt(filename_middle)[1:,3]
dmle_high_vec=np.loadtxt(filename_middle)[1:,4]
mle_high_weights=1/dmle_high_vec**2
mle_high_avg=np.average(mle_high_vec,weights=mle_high_weights)
mle_high_err=np.sqrt(1/sum(mle_high_weights))
print("MLE=(%d±%d)"%(mle_high_avg,mle_high_err))

MLE_final=(mle_avg+mle_high_avg)/2
MLE_final_err=(-mle_avg+mle_high_avg)/2
print("MLE=(%d±%d)"%(MLE_final,MLE_final_err))