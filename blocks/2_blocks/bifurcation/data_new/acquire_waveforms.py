import pyvisa, sys
import numpy as np
import time

def usage():
	print("""Usage:
	python3 acquire_waveforms.py <nchans> <file_name> [<nr_pts>]
	> nchans = "1", "2", "3", "4"
	> file_name is the name of the output file
	> nr_pts (optional) is the number of samples (default 10k, recommended 10k, 100k)
	""")
	exit()

if __name__ == '__main__':

	addr = "USB0::6833::1300::DS7F251000038::0::INSTR"

	if len(sys.argv) < 3:
		usage()
	else:
		nr_chans = int(sys.argv[1])
		if ((nr_chans < 1) or (nr_chans > 4)):
			print("Invalid number of channels (should be between 1 and 4")
			exit()
		if (len(sys.argv) > 3):
			mdep = sys.argv[3]
		else:
			mdep = "10k"

		fd = open(sys.argv[2], 'w')

		rm = pyvisa.ResourceManager('@py')
		with rm.open_resource(addr) as dev:

			dev.read_termination = "\n"
			dev.write_termination = "\n"

			print(dev.query("*IDN?"))
			dev.write(":ACQ:MDEP %s" % mdep)
			time.sleep(0.1)
			print(dev.query(":ACQ:MDEP?"))

			dev.write(":RUN")
			time.sleep(6)
			dev.write(":STOP")

			dev.write(":WAV:FORM BYTE")
			dev.write(":WAV:MODE RAW")

			for nc in range(1,nr_chans+1):
				if (int(dev.query(":CHAN%d:DISP?" % nc)) == 0):
					print("Channel nr. %d is OFF! Exiting." % nc)
					exit()
				dev.write(":WAV:SOUR CHAN%d" % nc)
				preambolo = dev.query(":WAV:PRE?").split(",")
				if (nc == 1):
					nr_pts = int(preambolo[2])
					par_sampling_period = float(preambolo[4])
					par_time_offset = float(preambolo[5])
					trace_time = np.linspace(par_time_offset, par_time_offset + nr_pts * par_sampling_period, num=nr_pts)
					fd.write("#Tsamp:\t%e\n" % par_sampling_period)
					print("Samples: %d" % nr_pts)

				par_vert_scale = float(preambolo[7])
				par_vert_zero = int(preambolo[9])
				fd.write("#Vscale%s:\t%e\n" % (nc, par_vert_scale))

				dev.write(":WAV:DATA?")
				bin_data = np.array(dev.read_binary_values('B', data_points = nr_pts, expect_termination=False, chunk_size = 1024))
				trace_voltage = (bin_data - par_vert_zero + 1) * par_vert_scale
				if (nc == 1):
					all_traces_voltage = np.stack((trace_time, trace_voltage))
				else:
					all_traces_voltage = np.vstack((all_traces_voltage, trace_voltage))

			for i in range(nr_pts):
				fd.write("%e" % trace_time[i])
				for nc in range(1,nr_chans+1):
					fd.write("\t%e" % all_traces_voltage[nc,i])
				fd.write("\n")

