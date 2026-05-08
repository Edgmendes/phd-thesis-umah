close all;
clear all;

dc_array = [1,2,4,6,8,10,12];
dc_array_all = [1,2,4,6,8,10,12,14,16,18,20,30,40,50];

step = 1e-3;
offc = 15e-3;

step_val = int2str(step*1e3);
offc_val = int2str(offc*1e3);

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

Nx = size(x, 2);

data_aux = zeros(Nx,Nx,length(dc_array));

i_aux = 1;
for index = dc_array
    
    dc_val = int2str(index);
    filename = "Measurements/Space_DC"+dc_val+"_Fs500kHz_offc"+offc_val+"mm_step"+step_val+"mm_T1s.bin";

    %% open file
    fid = fopen(filename, 'r');
    data = reshape(fread(fid, 'double'), [], Nx, Nx);
    fclose(fid);
    data(:, :, 2:2:end) = flip(data(:, :, 2:2:end), 2);
  
    %Band Pass Filter the data (1/3 octave at 40kHz)
    for i = 1:Nx
        for j = 1:Nx
            data(:,i,j) = of(data(:,i,j));
        end
    end

    %% DC value romotion 
    data = data - mean(data,1);

    %% RMS
    data_aux(:,:,i_aux) = rms(data,1);

    i_aux = i_aux + 1;

end

p_rms = data_aux .* mic_sensitivity;

%% Linear Regression
X = dc_array';
X1 = [ones(length(X),1) X];

b2 = zeros(Nx,Nx,2);

for i = 1:Nx
    for j = 1:Nx
        % convert data to colomun vector
        Y = reshape(p_rms(i,j,:),1,length(dc_array))';
        %calculate the linear regression 
        b2(i,j,:) = X1 \ Y;
    end
end

%% Pressure estimations at all DCs
X_all = dc_array_all';
X_all = [ones(length(X_all),1) X_all];

p_est = zeros(Nx,Nx,length(dc_array_all));

for i = 1:Nx
    for j = 1:Nx
        p_est(i,j,:) = X_all * reshape(b2(i,j,:),2,1);
    end
end

%% FWHM

row = zeros(length(dc_array_all),1);
col = zeros(size(row));

fwhm_xx = zeros(size(row));
fwhm_yy = zeros(size(row));

%find maximum of the matrix
M = reshape( max(p_est,[],[1 2]), length(dc_array_all), 1); 

half_max = M/2;

for i = 1:length(dc_array_all)
    %find the indexes of the maximum (row col)
    [row(i),col(i)] = find( p_est(:,:,i) == M(i) );

    %number of element above the half max
    fwhm_xx(i) = size( find( p_est(row(i),:,i) >= half_max(i) ), 2);
    fwhm_yy(i) = size( find( p_est(:,col(i),i) >= half_max(i) ), 1);
end

diam_est = step*(fwhm_xx+fwhm_yy)/2;

%% Radiation Force at 20ºC
alpha = 2;
air_density = 1.2041;
speed_sound = 343.21;

% 15ºC
% air_density = 1.2250;
% speed_sound = 340.27;

force_est = zeros(size(row));
limits = round((fwhm_xx+fwhm_yy)/2);

% Check for eneven values, 
for i=1:length(limits)
    if(mod(limits(i),2))
        limits(i) = limits(i) + 1;
    end
end

for n = 1:length(dc_array_all)
    for i=col(n)-limits(n)/2:col(n)+limits(n)/2
       for j=row(n)-limits(n)/2:row(n)+limits(n)/2
            force_est(n) = ( ( p_est(i,j,n)^2 / (air_density * speed_sound^2) ) * (step)^2 ) + force_est(n); 
       end 
    end
end

force_est = force_est * alpha;

%% Store Results

dc_array_all = dc_array_all';

p_est_rms_max = reshape( max(p_est, [], [1 2] ), length(dc_array_all), 1); 
L_est_rms_max = 20 * log10(p_est_rms_max ./ 20e-6);

p_est_rms_max = round(p_est_rms_max);
L_est_rms_max = round(L_est_rms_max);
force_est = round(force_est,5);
T = table(dc_array_all,p_est_rms_max, L_est_rms_max, force_est);

writetable(T,'Force_Estimated.txt');

%% Top two plots
tiledlayout(2,2)
ax1 = nexttile
plot(dc_array_all,p_est_rms_max)
title(ax1,'FP RMS Pressure estimation')
xlabel(ax1,'Duty Cycle') 
ylabel(ax1,'Pascals')
grid(ax1,'on')

ax2 = nexttile
plot(dc_array_all,L_est_rms_max)
title(ax2,'FP RMS Intensity estimation')
xlabel(ax2,'Duty Cycle') 
ylabel(ax2,'dB SPL re 20u Pa')
grid(ax2,'on')

% Plot that spans
ax3 = nexttile([1 2])
plot(dc_array_all,force_est)
title(ax3,'FP Radiation Force estimation')
xlabel(ax3,'Duty Cycle') 
ylabel(ax3,'Newtons')
grid(ax3,'on')
