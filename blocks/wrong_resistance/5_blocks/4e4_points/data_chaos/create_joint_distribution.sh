#!/bin/bash

# Script arguments:

fileName=$1
NBinsX=$2
x0=$3
xf=$4
NBinsY=$5
y0=$6
yf=$7

# x = (m-1)L
# y = Nu

# LINEAR
# LINEAR SCALE
# x = int( (($1-1.0)*$2 - x0)/xf);	// Emb. window		from 1 to 380	===>	interval = 379 = 9.5*40
# y = int( ($4 - y0)/yf);		// Nu			from 0 to 4	===>	interval = 30 = 0.1*40

echo -e "#w\tnu\tjoint\tconditional\tprod_of_marginals"

cat $fileName | grep -v "#" | awk '{if ((NF>1)&&($3!="NaN")) print}' | awk -v NBinsX=$NBinsX -v NBinsY=$NBinsY \
	-v x0=$x0 -v y0=$y0 -v xf=$xf -v yf=$yf \
	'BEGIN {
		for(i=0; i <= NBinsX; i++)
			for(j=0; j <= NBinsY; j++)
				bin[i,j]=0;
		for(i=0; i <= NBinsX; i++)
			margEmbWindow[i] = 0;
		for(j=0; j <= NBinsY; j++)
			margCorrDim[j] = 0;
		N = 0;
		maxBin = 0;
		maxmargEmbWindow = 0;
		maxmargCorrDim = 0;
	}
	{
		x = int(((($1-1.0)*$2)-x0)/xf);
		y = int(($3-y0)/yf);
		bin[x,y]++;
		margEmbWindow[x]++;
		margCorrDim[y]++;
		N++;
	}
	END {
		for(i=0; i <= NBinsX; i++) {
			x = (i + 0.5)*xf + x0;

			m=0;
			s=0;
			n=0;
			maxLocation = NaN;
			maxValue = -1;

			if (margEmbWindow[i] > maxmargEmbWindow)
				maxmargEmbWindow = margEmbWindow[i];

			for(j=0; j <= NBinsY; j++) {
				y = (j + 0.5)*yf + y0;

				if (margCorrDim[j] > maxmargCorrDim)
					maxmargCorrDim = margCorrDim[j];

				if (bin[i,j] > maxBin)
					maxBin = bin[i,j];

				if (margEmbWindow[i]>0) {
					p = bin[i,j]/margEmbWindow[i];
					m += y*p;
					s += y*y*p;
					n += p;
					if (p > maxValue) {
						maxLocation = y;
						maxValue = p;
					}
				}

				printf("%f\t%f\t%f\t%f\t\t%f\n", x, y, bin[i,j], (margEmbWindow[i]>0)? bin[i,j]/margEmbWindow[i] : NaN, margEmbWindow[i]*margCorrDim[j]/N/N);
			}
			if (n>0) {
				m /= n;
				s /= n;
				s -= m*m;
				s = sqrt(s);
			} else {
				m=NaN;
				s=NaN;
			}
			printf("#Nubar_vs_w\t%f\t\t%f\t%f\t%f\t\t%f\n", x, m, s, n, maxLocation);
			printf("\n");
		}

		printf("\n");
		for(i=0; i <= NBinsX; i++) {
			x = (i + 0.5)*xf + x0;
			printf("#marg_w\t%f\t%f\n", x, margEmbWindow[i]/N);
		}

		printf("\n");
		for(j=0; j <= NBinsY; j++) {
			y = (j + 0.5)*yf + y0;
			printf("#marg_Nu\t%f\t%f\n", y, margCorrDim[j]/N);
		}

		printf("\n");
		printf("#maxValues\t%f\t%f\t%f\n", maxBin/N, maxmargEmbWindow/N, maxMargCorrDim/N);

	}'
