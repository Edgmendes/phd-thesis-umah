close all;
clear all;

dc_array = [1,2,4,6,8,10,12,14];
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
P_rms = zeros(Nx,Nx,length(dc_array));

i_aux = 1;
for index = dc_array
    
    dc_val = int2str(index);
    filename = "Measurements/Space_DC"+dc_val+"_Fs500kHz_offc"+offc_val+"mm_step"+step_val+"mm_T1s.bin";

    %% open file
    fid = fopen(filename, 'r');
    p_amp = reshape(fread(fid, 'double').*mic_sensitivity, [], Nx, Nx);
    fclose(fid);
    p_amp(:, :, 2:2:end) = flip(p_amp(:, :, 2:2:end), 2);

    %% DC value
    p_mean = sum(p_amp,1) / size(p_amp, 1);
    p_amp_2 = p_amp - p_mean;
    
    %% Filtering
    p_amp_f = zeros(size(p_amp));
    for i = 1:size(p_amp,2)
        for j = 1:size(p_amp,3)
            p_amp_f(:,i,j) = of(p_amp_2(:,i,j));
        end
    end
    
    %% RMS
    
    P_rms(:,:,i_aux) = permute(rms(p_amp_f, 1), [2 3 1]);
    i_aux = i_aux + 1;

end

%% Linear Regression
X = dc_array';
% b = zeros(Nx,Nx);
% 
% for i = 1:Nx
%     for j = 1:Nx
%         Y = reshape(P_rms(i,j,:),1,length(dc_array))';
%         b(i,j) = X\Y;
%     end
% end

X1 = [ones(length(X),1) X];
b2 = zeros(Nx,Nx,2);
for i = 1:Nx
    for j = 1:Nx
        Y = reshape(P_rms(i,j,:),1,length(dc_array))';
        b2(i,j,:) = X1\Y;
    end
end

%% Pressure estimations
X_all = dc_array_all';
X_all = [ones(length(X_all),1) X_all];

P_estimated = zeros(Nx,Nx,length(dc_array_all));

for i = 1:Nx
    for j = 1:Nx
        P_estimated(i,j,:) = X_all * reshape(b2(i,j,:),2,1);
    end
end


