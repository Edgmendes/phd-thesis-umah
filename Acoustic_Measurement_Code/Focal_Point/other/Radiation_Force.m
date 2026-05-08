close all; clear all; clc;

%% Configs
filename = 'Measurements/Space_DC14_Fs500kHz_offc15mm_step5mm_T1s.bin';

step = 5e-3; 
offc = 15e-3;

Fs = 500e3;
Ts = 1/Fs;
x = (-1*offc):step:offc;
mic_sensitivity = 1./3.6e-3;

%% 1/3 Octave filter
BW = "1/3 octave";  % Bandwidth
Order  = 8;           % Filter order
F0 = 40e3;        % Center frequency (Hz)
%Fs = fs;       % Sampling frequency (Hz)
of = octaveFilter(FilterOrder=Order,CenterFrequency=F0,  ...
                  Bandwidth=BW,SampleRate=Fs);

%%
Nx = size(x, 2);
fid = fopen(filename, 'r');
p_amp = reshape(fread(fid, 'double').*mic_sensitivity, [], Nx, Nx);
fclose(fid);
N = size(p_amp, 1);
p_amp(:, :, 2:2:end) = flip(p_amp(:, :, 2:2:end), 2);

%% DC value
p_mean = sum(p_amp,1) / N;
p_amp_2 = p_amp - p_mean;

%% Filtering
p_amp_f = zeros(size(p_amp));
for i = 1:size(p_amp,2)
    for j = 1:size(p_amp,3)
        p_amp_f(:,i,j) = of(p_amp_2(:,i,j));
    end
end

%% RMS

p_rms = permute(rms(p_amp_f, 1), [2 3 1]);

%% FWHM

%find maximum of the matrix
M = max(p_rms,[],'all');

%find the indexes of the maximum (row colomn)
[row,col] = find(p_rms==M);

half_max = M/2;

%number of element above the half max
k_row = find(p_rms(row,:)>=half_max);
k_col = find(p_rms(:,col)>=half_max);

%the distance is given by the number of elements * spacial resolution
fwhm_xx = size(k_row,2);
fwhm_yy = size(k_col,1);

diameter_fwhm = step*(fwhm_xx+fwhm_yy)/2;

%% Radiation Force
alpha = 2;
% at 20ºC
air_density = 1.2041;
speed_sound = 343.21;

force = 0;
limits = round((fwhm_xx+fwhm_yy)/2);

if(mod(limits,2))
    limits = limits + 1;
end

for i=col-limits/2:col+limits/2
   for j=row-limits/2:row+limits/2
    force = ( ( p_rms(j,i)^2 / (air_density * speed_sound^2) ) * (step)^2 ) + force; 
   end 
end


force = force * alpha

%% Plots
surf(x, x, p_rms, 'FaceColor', 'interp', 'EdgeColor', 'none');
view(2);
axis square;
xlabel('X position (m)');
ylabel('Y position (m)');
colormap(jet(2.^8));
c = colorbar;
ylabel(c, 'RMS sound pressure (Pa)');

% figure;
% surf(x, x, I, 'FaceColor', 'interp', 'EdgeColor', 'none');
% view(2);
% axis square;
% xlabel('X position (m)');
% ylabel('Y position (m)');
% colormap(jet(2.^8));
% c = colorbar;
% ylabel(c, 'Sound Intensity (Pa)');

