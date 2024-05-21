import numpy as np
input_file='map.dat'
output_file='bin_nu.dat'
nu_list=np.loadtxt(input_file)[:,2]
bin_width=0.15
bins=np.arange(1,10+bin_width,bin_width)
nu_binned=np.histogram(nu_list,bins)[0]
np.savetxt(output_file,np.vstack((bins[:-1],nu_binned)).T)
