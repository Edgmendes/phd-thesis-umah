close all; clear all; clc;

%% Configs
filename = './F1HzSR10_Fs500000Hz_T3s_Center130mm_Off10mm_Step5mmDC12.bin';
%filename = './Results_space_measurements/F3HzSR10_Space_Fs500kHz_T1s_center145mm_offc45mm_step2dt5mm.bin';
%filename = 'F1HzSR50_F50HzSR50_Fs500kHz_T6s_center160mm_offc10mm_step2.5mm.bin';
Fs = 500e3;
x = -10e-3:5e-3:10e-3;
mic_sensitivity = 1./3.6e-3;

%%
Nx = size(x, 2);
fid = fopen(filename, 'r');
y = reshape(fread(fid, 'double').*mic_sensitivity, [], Nx, Nx);
fclose(fid);
N = size(y, 1);
y(:, :, 2:2:end) = flip(y(:, :, 2:2:end), 2);
Y = fft(y, [], 1)./N;

Ts = 1/Fs;
t = 0:Ts:N/Fs-Ts;
f = 0:Fs/N:Fs-Fs/N;

%% Plots
[~, ind] = max(Y, [], 'all', 'ComparisonMethod', 'abs');
[~, row, col] = ind2sub(size(Y), ind);

figure('units', 'normalized', 'outerposition', [0 0 1 1]);

subplot(2, 2, 1);
plot(t, y(:, row, col));
grid on;
grid minor;
xlabel('Time (s)');
ylabel('Sound pressure (Pa)');
% clear y;

subplot(2, 2, 2);
plot(f, abs(Y(:, row, col)));
grid on;
grid minor;
xlabel('Frequency (Hz)');
ylabel('Sound pressure (Pa)');

subplot(2, 2, 3);
clear Y;
y = permute(rms(y, 1), [2 3 1]);
% Y = 2.*permute(abs(max(Y, [], 1, 'ComparisonMethod', 'abs')), [2 3 1]);
surf(x, x, y, 'FaceColor', 'interp', 'EdgeColor', 'none');
view(2);
axis square;
xlabel('X position (m)');
ylabel('Y position (m)');
colormap(jet(2.^8));
c = colorbar;
ylabel(c, 'RMS sound pressure (Pa)');

subplot(2, 2, 4);
y = 20.*log10(y./20e-6);
% Y = 20.*log10(Y./20e-6);
surf(x, x, y, 'FaceColor', 'interp', 'EdgeColor', 'none');
view(2);
axis square;
xlabel('X position (m)');
ylabel('Y position (m)');
colormap(jet(2.^8));
c = colorbar;
ylabel(c, 'RMS sound pressure (dB_{SPL})');
