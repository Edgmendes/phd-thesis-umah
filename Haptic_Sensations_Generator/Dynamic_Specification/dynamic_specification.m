function [v, N_SP, Fmod] = dynamic_specification(stimulus_type, v, l)
% This function defined the ranges of values for the parameteres
% characterizing the dynamic sensation. It consideres perceptual related
% parameters for the specification.
% It receives the stimulus type of the dynamic sensation. This sensation
% can create four types of different dynamic sensation. The type is related
% with the temporal frequency of modulation and Number of positions (N_SP).
% The parameters velocity and length are described in terms of min and max.

%% Parameters

% anatomical and perceptual parameters
fp_diam = 15e-3; % diameter of the fp 
TOJ_th = 30e-3; % temporal order jugment threshold
palm_lenght = 9e-2; % lenght of the palm of an adult man
tif_critical = 3e-3; % duração crítica do estímulo 

% These values use the two point descrimination threshold (10mm - 15mm)
    % dif > TPD_th
    dif_rough = fp_diam;
    % dif < TPD_th
    dif_smooth = fp_diam / 3; % comes from my work 

N_min = l / fp_diam; % minimum number of positions
N_max = l / (v *  tif_critical);

N_rough = l / dif_rough;
N_smooth = l / dif_smooth;

%% Specification

r_min = fp_diam;
r_max = palm_lenght / 2;

% Parameter Speed 
v_min = 0.1;
v_max = fp_diam / TOJ_th;

% Parameter length
l_min = 2*pi*r_min;
l_max = 2*pi*r_max;

if ( strcmp(stimulus_type,'pressure_rough') )
    Fmod = 0;
    N_SP = N_rough;
elseif( strcmp(stimulus_type,'pressure_smooth') )
    Fmod = 0;
    N_SP = N_smooth; 
elseif(strcmp(stimulus_type,'vibration_low') )
    Fmod = 50;
    N_SP = N_smooth; 
elseif( strcmp(stimulus_type,'vibration_high') )
    Fmod = 200;
    N_SP = N_rough;
end

if ( (v >= v_min && v <= v_max) && (l >= l_min && l <= l_max) )
    disp(" Especificação Correta ");
    state = true;

    X = ['v',' : ',num2str(v), newline ,'l',' : ',num2str(l), newline , ...
    'N_min',' : ',num2str(N_min), newline , 'N_max',' : ',num2str(N_max)];
    disp(X)

else
    disp(" Especificação Errada ");
    state = false;

    v = 0;
    l = 0;
    N_SP = 0;
    Fmod = 0;

    X = ['v_min',' : ',num2str(v_min), newline ,'v_max',' : ',num2str(v_max), newline , ...
    'l_min',' : ',num2str(l_min), newline , 'l_max',' : ',num2str(l_max)];
    disp(X)

end

end