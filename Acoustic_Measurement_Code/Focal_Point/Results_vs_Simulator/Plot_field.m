close all; clear all; clc;

%% Configs
filename = '../Results/Space_DC12_Fs500kHz_offc15mm_step1mm_T1s.bin';

step = 1e-3;
offc = 15e-3;

% Fs = 500e3;
% Ts = 1/Fs;

x = (-1*offc):step:offc;
mic_sensitivity = 1./3.6e-3;

%%
Nx = size(x, 2);
fid = fopen(filename, 'r');

data = fread(fid, 'double');

%% DC value romotion 
data = data - mean(data,1);

y = reshape(data.*mic_sensitivity, [], Nx, Nx);
fclose(fid);
y(:, :, 2:2:end) = flip(y(:, :, 2:2:end), 2);

y = permute(rms(y, 1), [2 3 1]);

%% RMS value
p_rms = max(y,[],'all');
p1 = sprintf('RMS Pressure: %d', p_rms);
disp(p1);


%% Plot
surf(x * 1e3, x * 1e3, y, 'FaceColor', 'interp', 'EdgeColor', 'none');
view(2);
axis square;
xlabel('X (mm)');
ylabel('Y (mm)');
colormap(jet(2.^8));
c = colorbar;
ylabel(c, 'Sound Pressure RMS (Pa)');
title("Focal Point acoustic field");