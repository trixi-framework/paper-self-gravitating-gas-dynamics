#!/usr/bin/env python3

from math import log10
import matplotlib
matplotlib.use('Agg')
from matplotlib import rc
from numpy import *
from matplotlib.pyplot import *
import sys

rc('text', usetex=True)
rc('font', family='serif')
rc('font', size=10)
matplotlib.rcParams['text.latex.preamble']=[r"\usepackage{amsmath}"]

fig = figure(1, figsize=(15,12))

# load data for plotting

exact_ke = loadtxt('E_kin.txt')
exact_ie = loadtxt('E_int.txt')
exact_pe = loadtxt('E_pot.txt')
# approxiamte solution data file name is given by the user, e.g,
# ./jeans_all_in_one analysis.dat
computed = loadtxt(sys.argv[1])

# values necessary to scale the time by the frequency \omega

# wave numbers of perturbation
lambda_x = 0.5
lambda_y = 0.5
kx = 2.0*pi/lambda_x
ky = 0.0 # 2.0*pi/lambda_y
k2 = kx*kx + ky*ky

# Newton and adiabatic constants
G = 6.674e-8
gamma = 5.0/3.0

# background density, pressure: perturbation size and sound speed
rho0 = 1.5e7
p0 = 1.5e7
c0 = sqrt(gamma*p0/rho0)
delta0 = 1e-3

# domain size
L = 1.0

# Jeans wave number and frequency
kJ = sqrt(4.0*pi*G*rho0)/c0
omega = sqrt(c0*c0*k2 - 4.0*pi*G*rho0)

# setup the four axis parts

axs = fig.subplots(3,sharex=True)

# labels
axs[0].set_ylabel('$E_{\\mathtt{kin}}$',fontsize=28)
axs[1].set_ylabel('$E_{\\mathtt{int}} - E_{\\mathtt{int}}\\big|_{t = 0}$',fontsize=28)
axs[2].set_ylabel('$E_{\\mathtt{pot}}$',fontsize=28)
axs[2].set_xlabel('$\omega{t}$',fontsize=28)

# kinetic energy plot

axs[0].xaxis.set_major_locator( MultipleLocator(1)  )
axs[0].yaxis.set_major_locator( MultipleLocator(1) )
axs[0].xaxis.grid(color='gray', linestyle='-',alpha=0.2,which='major')
axs[0].yaxis.grid(color='gray', linestyle='-',alpha=0.2,which='major')

extract  = array([[exact_ke[i][0],exact_ke[i][1]] for i in range(len(exact_ke))])
axs[0].plot(extract[:,0], extract[:,1],'-',linewidth=1.25,color='black',label='exact')
kin_en = array([[omega*computed[i][1],computed[i][13]] for i in range(len(computed))])
axs[0].plot(kin_en[:,0], kin_en[:,1],'-->',markersize=6.0,linewidth=1.25,markevery=2,color='red',label='$E_{\\mathtt{kin}}$')

axs[0].axis([0,80,0.0,6.25])
axs[0].xaxis.set_ticks(range(0, 85, 5))
axs[0].yaxis.set_ticks(range(0, 7, 1))
axs[0].set_yticklabels(range(0, 7, 1),fontsize=18)

# internal energy plot

axs[1].xaxis.set_major_locator( MultipleLocator(1)  )
axs[1].yaxis.set_major_locator( MultipleLocator(1) )
axs[1].xaxis.grid(color='gray', linestyle='-',alpha=0.2,which='major')
axs[1].yaxis.grid(color='gray', linestyle='-',alpha=0.2,which='major')

extract  = array([[exact_ie[i][0],exact_ie[i][1]] for i in range(len(exact_ie))])
axs[1].plot(extract[:,0], extract[:,1],'-',linewidth=1.25,color='black',label='exact')
int_en = array([[omega*computed[i][1],computed[i][14] - computed[0][14]] for i in range(len(computed))])
axs[1].plot(int_en[:,0], int_en[:,1] - int_en[0,1],'--o',markersize=6.0,linewidth=1.25,markevery=2,color='green',label=order)

axs[1].axis([0,80,int_en[0,1]-6.5,int_en[0,1]])
axs[1].xaxis.set_ticks(range(0, 85, 5))
axs[1].yaxis.set_ticks(range(-6, 1, 1))
axs[1].set_yticklabels(range(-6, 1, 1),fontsize=18)

# potential energy

axs[2].xaxis.set_major_locator( MultipleLocator(1) )
axs[2].yaxis.set_major_locator( MultipleLocator(0.1) )
axs[2].xaxis.grid(color='gray', linestyle='-',alpha=0.2,which='major')
axs[2].yaxis.grid(color='gray', linestyle='-',alpha=0.2,which='major')

extract  = array([[exact_pe[i][0],exact_pe[i][1]] for i in range(len(exact_ie))])
axs[2].plot(extract[:,0], extract[:,1],'-',linewidth=1.25,color='black',label='exact')
pot_en = array([[omega*computed[i][1],computed[i][15]] for i in range(len(computed))])
axs[2].plot(pot_en[:,0], pot_en[:,1],'--v',markersize=6.0,linewidth=1.25,markevery=2,color='blue',label=order)

axs[2].axis([0,80,-0.61,0.0])
axs[2].xaxis.set_ticks(range(0, 85, 5))
axs[2].set_xticklabels(range(0, 85, 5),fontsize=18)
axs[2].yaxis.set_ticks(arange(-0.6, 0.1, 0.1))
axs[2].set_yticklabels(["-0.6","-0.5","-0.4","-0.3","-0.2","-0.1","0.0"],fontsize=18)

tight_layout()

savefig('test.pdf')
