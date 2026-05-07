function [temporal_shifts] = Get_Temporal_Shifts(temporal_signal, N_SP, t_sp, T_draw, t)
% A matrix of time shifted temporal signals is created here.

% Parameters
% temporal_signal
% N_SP
% t_sp and F_mod
% time vector for plotting

%% Creates the temporal impulse matrix
temp_imp = sparse(zeros(N_SP, length(temporal_signal)));

% t_off for centring the signal
t_off = (((t_sp/2)*length(t))/T_draw)-1;

% tif_off for shifting the signal
tif_off = (t_sp*length(t))/T_draw;

t_off = round(t_off);
tif_off = round(tif_off);

%Create the impulse matrix
for i = 1:N_SP
    temp_imp(i, i * tif_off - t_off) = 1;
end

%% Plot
% SPs = 1:1:N_SP;
% figure;
% image(t,SPs,temp_imp,'CDataMapping','scaled');
% colorbar;
% title('Imp Mat Temporal');
% xlabel('Time');
% ylabel('SPs');

%% Convolve the temporal signal with the impulse matrix, to get shifted
% temporal signals
temporal_shifts = sconv2(temp_imp,temporal_signal,'same');

%% Plot
% SPs = 1:1:N_SP;
% figure;
% image(t,SPs,temporal_shifts,'CDataMapping','scaled');
% colorbar;
% title('Shifted Temporal');
% xlabel('Time');
% ylabel('SPs');

end