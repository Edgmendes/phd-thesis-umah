# -*- coding: utf-8 -*-
"""
Created on Wed Apr 23 14:35:50 2025

@author: Eduardo_Mendes
"""

import numpy as np
import os
from read_signal import read_params
from distances_to_plane import distances_to_XY_plane
from plot_field import plot_plane
from pressure_calculation import pressure_calculation
from directivity_calculation import directivity_xy
from ArrayFrameReader import ArrayFrameReader

foldername = 'out_Signal/';

bin_file_Stimulus = "input_files/Stimulus.bin"


## Read PARAMS of the Signal
[array_length, N_source, fp_height, f_carrier, speed_sound, t_samples, T_draw, dt, Tau, Stimulus, Amax_FP, nFPs, word_bits] = read_params('input_files/params.txt');

if word_bits==16:
    bin_file_FP = "FP_Center/FP_Center_16bits.bin";
elif word_bits==32:
    bin_file_FP = "FP_Center/FP_Center_32bits.bin";
        


# Example assumption:
#   upper 16 bits  -> amplitude
#   lower 16 bits  -> phase
reader_FP = ArrayFrameReader(
    filepath=bin_file_FP,
    num_transducers=int(N_source**2),
    word_bits=word_bits,
    amplitude_shift=int(word_bits/2),
    amplitude_bits=int(word_bits/2),
    phase_shift=0,
    phase_bits=int(word_bits/2),
    endian="<",      # change to ">" if your file is big-endian
    amplitude_normalized = True,
    phase_in_degrees=False,
    phase_in_radians = True
)

    

reader_Stimulus = ArrayFrameReader(
    filepath=bin_file_Stimulus,
    num_transducers=int(N_source**2),
    word_bits=word_bits,
    amplitude_shift=int(word_bits/2),
    amplitude_bits=int(word_bits/2),
    phase_shift=0,
    phase_bits=int(word_bits/2),
    endian="<",      # change to ">" if your file is big-endian
    amplitude_normalized = True,
    phase_in_degrees=False,
    phase_in_radians = True
)


if not os.path.exists("images_top"):
    os.mkdir("images_top");

##
##
##
##
SHOW = 0;
SAVE = 1;
##
##

################################################################
##                                                            ##                                      
##                      PARAMETERS                            ##
##                                                            ##
################################################################

f = f_carrier
ro = 1.21
wave_length = speed_sound / f
k = (2*np.pi)/wave_length

diam = array_length/N_source;        # diameter of the transducer (surface emitter is filled with emitters)
a = diam / 2;                        # radious of the tranducer
a = a - 0.5e-3;                      # Lets reduce by 1 mm the diameter for a more realistic pressure value 


##
## SOURCE STRENGTH - Q; AND RADIAL VELOCITY - U0
## Emitter radial velocity, m/s, measured for normal source of radious a
##

# U0 = (2*wave_length*r*p(r))/(r0*c*pi*(a^2))
# Nota que estas condições derivam das especificações do transdutor. r = 30cm, p(.3) = 28.28 Pa (pico)
U0 = (2*wave_length*0.3*28.28)/(ro*speed_sound*np.pi*(a**2));
Q = np.pi * a**2 * U0;      # Estou a usar o conceito de source strength, pois este 'torna evidente' o impacto do tamanho do transdutor no calculo da pressão
const = (1j * ro * speed_sound * Q) / wave_length;

##
## Simmulation params
##

space = 0.10
n = 1
ds = wave_length / n

## Observation X-Y plane coords
x_plane = np.linspace(-space/2, space/2, int(1/ds))
y_plane = x_plane;

## Emitter source coords
x_pos = np.linspace(-array_length/2, array_length/2, N_source)
y_pos = x_pos;
z_pos = 0.0

##
## Calculation of the Distances
##

# XY
r_xy = distances_to_XY_plane(x_plane, y_plane, fp_height, x_pos, y_pos, z_pos);

phases_xy = k * r_xy; # Radial wave number scalling (its for the phase calculation)

## Calculation of the Directivity
D = directivity_xy(x_plane, y_plane, fp_height, x_pos, y_pos);
D = D.astype(np.float32);


## Max Amplitude  (used for plotting)
#[amplitudes, phases_i] = read_stm_sample('FP_center/1.txt'); 

for frame_idx, amp, ph in reader_FP.frames():
    amplitudes = np.reshape(amp, (len(amp),1,1));
    phases = np.reshape(ph, (len(ph),1,1));


P_amp = amplitudes * const;

p_xy = pressure_calculation(r_xy, phases_xy, P_amp, phases, D=1);

p_abs_xy = np.abs(p_xy);
p_max_fp = np.max(p_abs_xy)
# print(p_max_fp)

#fig_top = plot_plane(p_abs_xy, x_plane, y_plane, dt, Tau, Stimulus, frame_idx+1, 0, p_max_fp/nFPs, SHOW=1);

##
## (LOOP) Read the FILEs containing the signal
##

n_SP = 1;
frame = 1;
flag = 1;


#for N_source in range(t_samples):
    
for frame_idx, amp, ph in reader_Stimulus.frames():
    
    # resize data for compatibility
    amplitudes = np.reshape(amp,(len(amp),1,1));
    phases = np.reshape(ph,(len(ph),1,1));
           
    P_amp = amplitudes * const;
    
    ## Pressure CALC
    p_xy = pressure_calculation(r_xy, phases_xy, P_amp, phases, D=D);    
    p_abs_xy = np.abs(p_xy);
    
    # p_max = np.max(p_abs_xy)
    # print(p_max)
    
    ## XY
    fig_top = plot_plane(p_abs_xy, x_plane, y_plane, dt, Tau, Stimulus, frame_idx+1, n_SP, p_max_fp/nFPs, SHOW=SHOW);
            
    if SAVE == 1:
        
        print(frame)
        filename_image = "images_top/fig_" + str(frame) + ".png";
        fig_top.write_image(filename_image)
        frame = frame + 1;
    
    #break;