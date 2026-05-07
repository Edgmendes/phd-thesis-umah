close all;
clear all;
clc;

%% PARAMS

word_bits = 32; % size of word for the binary file

% Parameters for the calculation of the reference phases
fp_pos = [0 0 0.2];        % (x,y,z)->[m]
f_carrier = 40e3;           % [Hz]
speed_sound = 343;          % [m/s]

% Resolution of the s-t signal
ds_virtual = 0.5e-3;        % [m]
dt = 1e-4;                  % [s]   note: 1e-4 avoids rounding problems related w temporal shifts

% Number of transducers of the array
N_source = 16;

% Array dimensions (real and virtual)
l_virtual = 0.5;    % [m]
l_source = 0.16;   % [m]

% Parameter for the configuration of the smothing window 
smooth_duration = 0.01;    %[s]

%% 
addpath('C:\Users\Eduardo_Mendes\OneDrive - UM\OneDrive - Universidade do Minho\PhD\Matlab\Acoustics\Framework\3D-Final\v7_git\Haptic_Stimuli_Generator\Algorithm\Impulse_Mat_Shapes')
addpath('C:\Users\Eduardo_Mendes\OneDrive - UM\OneDrive - Universidade do Minho\PhD\Matlab\Acoustics\Framework\3D-Final\v7_git\Haptic_Stimuli_Generator\Algorithm\Temporal_Shapes')

DIR_NAME = 'auxiliary_files/';
OUT_DIR_NAME = 'output_files/';
FILE_NAME = strcat(OUT_DIR_NAME,'Stimulus.bin');

if exist(DIR_NAME, 'dir')
    rmdir(DIR_NAME, 's');
end

if exist(OUT_DIR_NAME, 'dir')
    rmdir(OUT_DIR_NAME, 's');
end

if exist(FILE_NAME, 'file')
    delete(FILE_NAME);
end

mkdir(DIR_NAME);
mkdir(OUT_DIR_NAME);    
edit(FILE_NAME);

%% LOOP

load('input_files/info_fps.mat');   % Number of FPs to process

% AUX variables (use in the Simulator for vizualization)
%t_aux = zeros(nFPs,1);
T_draw_aux = zeros(nFPs,1);

% Maximum mic dynamic range
A_max_mic = 0.24;

signals = cell(nFPs,1);

for i = 1 : nFPs
    filename = strcat('input_files/FP_',int2str(i),'.mat');

    % Read the parameters of the sensation (FP)
    load(filename);

    A_max = A_max_mic / nFPs;

    tic
    
    % Generare the s-t signal
    
    [spatial_temporal_signal, t, x_real] = Generate_STM_signal(stimulus_period, stimulus_samplerate, stimulus_length, ...
                                                    stimulus_shape, stimulus_modulation, modulation_frequency, ...
                                                    f_carrier, fp_pos, speed_sound, ...
                                                    dt, ds_virtual, N_source, ...
                                                    l_virtual, l_source, ...
                                                    smooth_duration, A_max);
    
    spatial_temporal_signal = single(spatial_temporal_signal);

    signals{i} = spatial_temporal_signal;

    % AUX variables
    T_draw_aux(i) = stimulus_period;

end

% Process and Add the multiple signals if more than one FP
if nFPs > 1
    [spatial_temporal_signal] = Post_Processing_Signals(signals, nFPs);
end

%%
n_bits = word_bits/2;

[magnitudes, phases] = Rescale_cast_data(spatial_temporal_signal, n_bits, t, x_real);

Create_stimulus_file(magnitudes, phases, FILE_NAME, n_bits)

%% SAVE PARAMS FOR SIMULATOR
params = 't_samples - ' + string(size(spatial_temporal_signal,3)) + '; Nsource - ' + string(N_source) ...
        + '; Lsource - ' + string(l_source) + '; Z_plane - ' + string(fp_pos(3)) ...
        + '; F_carrier - ' + string(f_carrier) + '; speed_sound - ' + string(speed_sound) ...
        + '; Tdraw - ' + string(max(T_draw_aux)) + '; dt - ' + string(dt) + '; Smoothness duration - ' + sprintf('%0.5f', smooth_duration) ...
        + '; Stimulus - ' + 'General Stimulus' + '; Amax_FP - ' + A_max + '; nFPs - ' + nFPs ...
        + '; Word Bits - ' + word_bits;

filename = strcat('output_files\', 'params.txt');
writematrix(params,filename);

toc

