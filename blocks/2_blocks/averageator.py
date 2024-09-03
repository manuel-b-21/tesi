import numpy as np

input_file='two_blocks_05V_10s.csv'
output_file='2_blocks_avg_05V.dat'
data=np.loadtxt(input_file)
avg_step=10 #average every avg_step points
length=int(len(data[:,0])/avg_step)
data_avg=np.zeros((length,3))
data_avg[:,0]=[np.mean(data[i*avg_step:(i+1)*avg_step,0]) for i in range(length)]
data_avg[:,1]=[np.mean(data[i*avg_step:(i+1)*avg_step,1]) for i in range(length)]
data_avg[:,2]=[np.mean(data[i*avg_step:(i+1)*avg_step,2]) for i in range(length)]
#data_avg[:,3]=[np.mean(data[i*avg_step:(i+1)*avg_step,3]) for i in range(length)]
#data_avg[:,4]=[np.mean(data[i*avg_step:(i+1)*avg_step,4]) for i in range(length)]
np.savetxt(output_file,data_avg)
