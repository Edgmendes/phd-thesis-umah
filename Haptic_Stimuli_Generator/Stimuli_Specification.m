close all;
clear all;

%%
OUT_DIR_NAME = "./Algorithm/input_files\";

if exist(OUT_DIR_NAME, 'dir')
    rmdir(OUT_DIR_NAME, 's');
end

mkdir(OUT_DIR_NAME);

%% Stimulus parameters
% stimulus_period [s]
% stimulus_samplerate [n#]
% stimulus_length [m]
% stimulus_shape [id]
% stimulus_modulation [id]

%% Shapes
% 'circle'
% 'square'
% 'line'
% 'triangle'
% 'spiral'
% 'ellipse'
% 'rhombus'
% 'cardoid'
% 'star'

%% Modulation Types
% 'sinusoidal'    (remember, a constant amplitude is equal to a sinus with 0 Hz)
% 'triangular'
% 'square'
% 'sawtooth'
% 'exponential'
% 'chirp'       (frequency is varied between 0 Hz to 250 Hz)

%% Modulation Frequency
% in Hertz


%% Speeds [m/s]
slow = 0.157;
fast = 0.45;

%% Lengths  [m]
% - circle
big = 0.157;
small = 0.1;

length_square = 0.24;   % square
length_line = 0.095;    % line
length_triangle = 0.18; % triangle
length_spiral = 0.15;   % spiral
side_length_rhombus = 0.05; % rhombus
heart_width = 0.08;     % heart


%% Parameters of the stimulus  

%% Example Stimulus
% Stimulus = {stimulus_period, stimulus_samplerate, stimulus_length, stimulus_shape,...
%             stimulus_modulation, modulation_frequency};

% Stimulus = {1, 20, big, 'circle', 'sinusoidal', 0;
%             0.02, 20, small, 'circle', 'sinusoidal', 0};

Stimulus = {1, 20, big, 'circle', 'sinusoidal', 0};

%%
% Loop that returns the signal e-t specification
%

nFPs = size(Stimulus,1);
for i = 1 : nFPs

    % read the specification of the stimulus
    stimulus_period = Stimulus{i,1};
    stimulus_samplerate = Stimulus{i,2};
    stimulus_length = Stimulus{i,3};
    stimulus_shape = Stimulus{i,4};
    stimulus_modulation = Stimulus{i,5};
    modulation_frequency = Stimulus{i,6};

    %% COMM w/ FW
    filename = strcat('FP_',int2str(i),'.mat'); % name of the FP file
    delete(filename);
    save(filename, "stimulus_period", "stimulus_samplerate", "stimulus_length", "stimulus_shape", "stimulus_modulation", "modulation_frequency" ); % save on the FP file the necessary info

    filename_path = strcat('./Algorithm/input_files/FP_',int2str(i),'.mat');
    delete(filename_path);
    save(filename_path, "stimulus_period", "stimulus_samplerate", "stimulus_length", "stimulus_shape", "stimulus_modulation", "modulation_frequency" );
end

%% COMM w/ FW

filename = 'info_fps.mat'; % Save info about the number o FPs

delete(filename);
save(filename, 'nFPs');

filename_path = strcat('./Algorithm/input_files/',filename);
delete(filename_path);
save(filename_path, 'nFPs');

%Run Framework
run ./Algorithm/Algo_script