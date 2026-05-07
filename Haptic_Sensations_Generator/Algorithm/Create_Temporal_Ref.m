function [temporal_ref] = Create_Temporal_Ref(t, F_mod, A_max)
% Creates the temporal reference. 
% It is limited in time, required for the time shifting of the signal later on.

%Parameters & Variables
A = 0.5; % sinusoidal amplitude
A_off = A + 0.01; % sinusoidal DC component (i want the sinus positive)

% Temporal reference for all t
temporal_ref = A * cos(2*pi*F_mod*t) + A_off;

temporal_ref = A_max * temporal_ref;

% figure;
% plot(t, temporal_ref);

end