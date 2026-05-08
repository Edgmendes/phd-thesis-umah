close all;
clear all;

%% Configs
filename = "../Results/Space_DC12_Fs500kHz_offc15mm_step1mm_T1s.bin";
mic_sensitivity = 1./3.6e-3;

step = 1e-3;
offc = 15e-3;

Fs = 500e3;
% Ts = 1/Fs;

x = (-1*offc):step:offc;
Nx = size(x, 2);

%% 1/3 Octave filter
BW = "1/3 octave";      % Bandwidth
Order  = 8;             % Filter order
F0 = 40e3;              % Center frequency (Hz)

of = octaveFilter(FilterOrder=Order,CenterFrequency=F0,  ...
                  Bandwidth=BW,SampleRate=Fs);

%% open file
fid = fopen(filename, 'r');

data = fread(fid, 'double');

%% DC value romotion 
data = data - mean(data,1);

data = reshape(data.* mic_sensitivity, [], Nx, Nx);
fclose(fid);

data(:, :, 2:2:end) = flip(data(:, :, 2:2:end), 2);

%Band Pass Filter the data (1/3 octave at 40kHz)
for i = 1:Nx
    for j = 1:Nx
        data(:,i,j) = of(data(:,i,j));
    end
end

%% RMS
p_rms = permute(rms(data, 1), [2 3 1]);

p_rms_max = max(p_rms,[],'all');

%% Peak
p_peak = p_rms_max .*sqrt(2);


%% FWHM and Force

fwhm = FWHM(p_rms, step);

force = Radiation_Force(p_rms, fwhm, step);

%% Display

p1 = sprintf('RMS Pressure: %d', p_rms_max);
p2 = sprintf('Peak Pressure: %d', p_peak);

disp(p1);
disp(p2);
