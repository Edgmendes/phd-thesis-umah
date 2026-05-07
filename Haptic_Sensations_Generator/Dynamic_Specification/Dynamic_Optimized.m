close all;
clear all;

%%
OUT_DIR_NAME = "../Algorithm/input_files\";

if exist(OUT_DIR_NAME, 'dir')
    rmdir(OUT_DIR_NAME, 's');
end

mkdir(OUT_DIR_NAME);
%

%% Dynamic Sensation Optimized
% 'pressure_rough_opt1'             -> Pulso á lá Gavrilov
% 'pressure_rough_opt2'             -> Pulse Modulation
rationON = 0.5; % Modulation index


%% Speed [m/s]
slow = 0.157;
fast = 0.45;

%% Length or Perimeter [m]
% - circle
big = 0.157;
small = 0.1;

stimulus_shape = 'circle';

% Stimuli Specification Example
% FPs = { 'stimulus_type', speed, stimulus_length, opt_mod_index, shape};
FPs = { 'pressure_rough_opt2', slow, big, 0.5, stimulus_shape};


%%
% Loop that returns the signal e-t specification
%

nFPs = size(FPs,1);
for i = 1 : nFPs

    % read the specification of the stimulus
    stimulus_type = FPs{i,1};
    v_fp = FPs{i,2};
    L = FPs{i,3};
    rationON = FPs{i,4};

    [v_fp, N_SP, F_mod, tp] = optimization_specification('pressure_rough', v_fp, L, rationON);
    

    %% Parameters for the generation of an e-t signal    
    N_SP = round(N_SP);
    T_draw = L / v_fp;

    %% COMM w/ FW
    filename = strcat('FP_',int2str(i),'.mat'); % name of the FP file
    delete(filename);
    save(filename, "stimulus_type", "T_draw", "F_mod", "N_SP", "L", "tp" ,"rationON", "stimulus_shape") % save on the FP file the necessary info

    filename_path = strcat('../Algorithm/input_files/FP_',int2str(i),'.mat');
    delete(filename_path);
    save(filename_path, "stimulus_type", "T_draw", "F_mod", "N_SP", "L", "tp", "rationON", "stimulus_shape")
end

%% COMM w/ FW

filename = 'info_fps.mat'; % Save info about the number o FPs

delete(filename);
save(filename, 'nFPs');

filename_path = strcat('../Algorithm/input_files/',filename);
delete(filename_path);
save(filename_path, 'nFPs');

%Run Framework
run ../Algorithm/Algo_script