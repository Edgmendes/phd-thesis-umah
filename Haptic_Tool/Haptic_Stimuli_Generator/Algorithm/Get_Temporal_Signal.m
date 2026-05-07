function [temporal_signal] = Get_Temporal_Signal(temporal_ref, window_signal_mat, N_SP, t)

temporal_signal = sparse(zeros(size(window_signal_mat)));

for i = 1 : N_SP

    temporal_signal(i,:) = temporal_ref .* window_signal_mat(i,:);

end

%% Plot
% SPs = 1:1:N_SP;
% figure;
% image(t,SPs,temporal_signal,'CDataMapping','scaled');
% colorbar;
% title('Shifted Temporal');
% xlabel('Time');
% ylabel('SPs');

end