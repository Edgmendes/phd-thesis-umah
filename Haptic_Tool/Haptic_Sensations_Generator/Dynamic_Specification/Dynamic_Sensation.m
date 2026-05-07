close all;
clear all;

%%
OUT_DIR_NAME = "../Algorithm/input_files\";

if exist(OUT_DIR_NAME, 'dir')
    rmdir(OUT_DIR_NAME, 's');
end

mkdir(OUT_DIR_NAME);

%% Shape
% 'circle'
% 'square'
% 'line'
% 'triangle'

%% Stimulus Type
% 'pressure_rough'
% 'pressure_smooth'
% 'vibration_high'
% 'vibration_low'

%% Speeds [m/s]
slow = 0.157;
fast = 0.45;

%% Length or Perimeter [m]
% circle
big = 0.157;
small = 0.1;

% square
length_square = 0.24;

% line
length_line = 0.095;

% triangle
length_triangle = 0.18;

%% Stimuli Specification Example
% FPs = { 'stimulus_type', speed, stimulus_length, opt_mod_index, shape};

% Stimuli Specification
stimulus_type = 'pressure_smooth';
stimulus_shape = 'circle';
stimulus_speed = slow;
stimulus_length = big;

FPs = {stimulus_type, stimulus_speed, stimulus_length, 0, stimulus_shape};

% FPs = { 'pressure_rough', slow, big, 0, 'circle';
%          'vibration_high', fast, length_square, 0, 'square'};


%% Beats
% speed1 = 0.5;
% speed2 = 0.1;
% FPs = { 'pressure_smooth', speed1, big, 0, 'circle';
%         'pressure_smooth', speed2, big, 0, 'circle'};


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
    stimulus_shape = FPs{i,5};
    tp = 0;

    %% Specification, see Chapter
    [v_fp, N_SP, F_mod] = dynamic_specification(stimulus_type, v_fp, L);

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